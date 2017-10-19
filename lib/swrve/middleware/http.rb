require 'faraday'
require 'faraday_middleware'

module Swrve
  module Middleware
    class Http

      extend Forwardable

      attr_accessor :connection

      def_instance_delegators :@client, :get, :post, :put

      def initialize(endpoint)
        @connection = Faraday.new(endpoint) do |conn|
          conn.request :url_encoded
          conn.adapter Faraday.default_adapter
        end
      end
    end
  end
end
