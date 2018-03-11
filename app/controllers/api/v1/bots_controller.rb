class Api::V1::BotsController < ApplicationController
  before_action :create_client

  def webhook
    render status: :ok, json: { data: "hello" }
  end

  protected

  def create_client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = Settings.line_bot.channel_secret
      config.channel_token = Settings.line_bot.channel_token
    end
    # signature = request.env["HTTP_X_LINE_SIGNATURE"]
    # unless client.validate_signature(body, signature)
    #   render status: :bad_request
    #   return
    # end
  end
end
