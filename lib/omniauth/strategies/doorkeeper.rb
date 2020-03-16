module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper
      option :client_options,
        site: Rails.application.config.x.doorkeeper.app_url

      uid do
        raw_info['id']
      end

      info do
        {
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me').parsed
      end
    end
  end
end
