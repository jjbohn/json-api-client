require "faraday"
require "faraday_middleware"

module JsonApiClient
  class Consumer
    def initialize(name)
      @name = name
    end

    def get(url)
      connection.get(url) do |request|
        request.headers["Content-Type"] = "application/vnd.api+json"
      end
    end

    def connection
      @connection ||= Faraday.new(url: config(:base_url)).tap do |connection|
        connection.authorization :Token, config(:token)
        connection.use FaradayMiddleware::ParseJson, content_type: /\bjson$/
      end
    end

    private

    def config(key)
      env_var = "#{@name}_#{key}".upcase
      ENV.fetch(env_var)
    rescue KeyError
      raise KeyError.new("Environment variable #{env_var} was requested, but is not set")
    end
  end
end
