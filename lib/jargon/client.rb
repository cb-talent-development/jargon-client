require 'jargon/exceptions'
require 'jargon/connection'
require 'jargon/request'
require 'jargon/resource'
require 'jargon/locales'
require 'jargon/localizations'
require 'jargon/users'
require 'jargon/result'
require 'oauth2'

module Jargon
  class Client
    attr_reader :locales, :localizations, :users
    attr_accessor :access_token, :base_url, :auth_method
    @key = ''
    @secret = ''

    include Jargon::Connection
    include Jargon::Request

    def initialize(hasharg)
      @base_url = hasharg[:base_url]
      if hasharg.has_key? :access_token
        @access_token = hasharg[:access_token]
      else
        @key = hasharg[:key]
        @secret = hasharg[:secret]
        @access_token = get_cc_token
      end
    end

    def localizations(id=nil)
      Jargon::Localizations.new(self, id)
    end

    def users(id=nil)
      Jargon::Users.new(self, id)
    end

    def get_cc_token
      client = OAuth2::Client.new(@key, @secret, site: @base_url)
      client.client_credentials.get_token
    end
  end
end
