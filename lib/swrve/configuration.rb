require 'faraday'

module Swrve
  class Configuration
    attr_accessor :ab_test_url, :api_url, :app_version, :api_key, :local_resource_path, :game_id,
                  :load_local_resources, :debug, :http_adapter, :api_version, :resource_timeout
    
    DEFAULT_API_ENDPOINT = 'api.swrve.com'
    DEFAULT_ABTEST_ENDPOINT = 'abtest.swrve.com'

    def initialize
      @http_adapter     = Faraday.default_adapter
      @api_version      = 1
      @resource_timeout = 4
    end

    def build_endpoints
      return if @api_url && @ab_test_url
      @api_url, @ab_test_url = [ "https://#{game_id}.#{DEFAULT_API_ENDPOINT}", 
                                 "https://#{game_id}.#{DEFAULT_ABTEST_ENDPOINT}" ]
    end

    def validate!
      [:game_id, :api_key, :app_version].each do |check_valid|
        raise ConfigurationError, "#{check_valid} is a required configuration setting" if self.send(check_valid).nil?
      end
    end
  end

  class ConfigurationError < Exception; end
end
