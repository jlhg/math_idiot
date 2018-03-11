module RequestHelpers
  def file_fixture(filename)
    "#{Rails.root}/spec/fixtures/#{filename}"
  end

  def api_headers
    {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request
end
