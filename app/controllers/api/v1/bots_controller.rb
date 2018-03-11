# coding: utf-8
require "line/bot"

class Api::V1::BotsController < ApplicationController
  before_action :create_client

  def webhook
    @events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          user_message = event.message["text"].gsub(/\s+/m, " ").strip
          reply_token = event["replyToken"]
          user_id = event["source"]["userId"]
          profile = JSON.parse(@client.get_profile(user_id).body)
          display_name = profile["displayName"]

          user = User.find_or_create_by line_key: user_id

          case user_message
          when /\Ahelp|怎麼用|用法|幫助\z/i
            help_text = "點菜: 輸入 \"點 <菜名> <價格> <人1> <人2> <人3> ...\"\n"
            help_text += "清除資料: 輸入 \"clear\" 或 \"清除資料\"\n"
            help_text += "顯示結果: 輸入 \"顯示結果\""
            message = {
              type: "text",
              text: help_text
            }
            @client.reply_message(reply_token, message)
          when /\Aclear|清除資料\z/i
            user.items.destroy_all
            user.participants.destroy_all

            message = {
              type: "text",
              text: "資料已清除"
            }
            @client.reply_message(reply_token, message)
          when /點 (\S+) (\d+) (.+)/
            item_name = $1
            item_price = $2
            participant_names = $3.split(" ")
            item = user.items.find_or_create_by name: item_name
            item.update_attributes price: item_price
            participant_names.each do |name|
              participant = user.participants.find_or_create_by name: name
              participant.orders.find_or_create_by item: item
            end
            message = {
              type: "text",
              text: "菜名: #{item_name} #{item_price}元\n點菜者: #{participant_names.join(" ")}"
            }
            @client.reply_message(reply_token, message)
          when /顯示結果/
            stats_text = ""
            user.items.each do |_item|
              stats_text += "#{_item.name} (#{_item.price}元): #{_item.orders.collect(&:participant).collect(&:name).join(" ")}\n"
            end

            stats_text += "\n"

            user.participants.each do |participant|
              total_price = 0
              participant.orders.each do |order|
                total_price += order.item.price
              end
              stats_text += "#{participant.name}: #{total_price}元\n"
            end

            stats_text.strip!
            stats_text = "查無資料" if stats_text.empty?

            message = {
              type: "text",
              text: stats_text
            }
            @client.reply_message(reply_token, message)
          end
        end
      end
    end

    render status: :ok, json: { data: "hello" }
  end

  protected

  def create_client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = Settings.line_bot.channel_secret
      config.channel_token = Settings.line_bot.channel_token
    end

    body = request.body.read
    signature = request.env["HTTP_X_LINE_SIGNATURE"]
    unless @client.validate_signature(body, signature)
      render status: :bad_request
      return
    end
    @events = @client.parse_events_from(body)
  end
end
