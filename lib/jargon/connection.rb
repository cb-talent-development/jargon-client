require 'faraday'
require 'faraday_middleware'

module Jargon
  module Connection
    def connection
      options = {
          :headers => {
              :user_agent => "jargon-client (Ruby) - #{Jargon::VERSION}"
          },
          :url => base_url
      }

      if access_token.is_a?(OAuth2::AccessToken) && access_token.expired?
        @access_token = get_cc_token
      end

      Faraday.new options do |conn|
        conn.request :oauth2, access_token.is_a?(OAuth2::AccessToken) ? access_token.token : access_token
        conn.request :json
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
