require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OauthSampleServer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.x.doorkeeper.app_url = ENV.fetch('DOORKEEPER_APP_URL') { 'http://127.0.0.1:3000' }
    config.x.doorkeeper.client_id = ENV.fetch('DOORKEEPER_CLIENT_ID') { 'YOUR CLIENT ID' }
    config.x.doorkeeper.client_secret = ENV.fetch('DOORKEEPER_CLIENT_SECRET') { 'YOUR CLIENT ID' }
  end
end
