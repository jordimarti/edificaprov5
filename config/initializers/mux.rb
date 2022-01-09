MuxRuby.configure do |config|
  config.username = Rails.application.credentials.dig(:mux, :mux_token_id)
  config.password = Rails.application.credentials.dig(:mux, :mux_token_secret)
end