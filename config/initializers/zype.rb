Zype.configure do |config|
  config.host = Rails.application.secrets.zype_host
  config.api_key = Rails.application.secrets.zype_api
end
