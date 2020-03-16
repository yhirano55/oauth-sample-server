require 'omniauth/strategies/doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper, Rails.application.config.x.doorkeeper.client_id, Rails.application.config.x.doorkeeper.client_secret
end
