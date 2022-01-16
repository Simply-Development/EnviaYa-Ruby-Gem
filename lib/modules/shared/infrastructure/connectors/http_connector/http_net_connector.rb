require 'json'
require 'net/http'
require 'uri'
require_relative '../../../domain/value_objects/http_method_value_object.rb'
require_relative '../../../domain/connectors/http_connector.rb'

module EnviaYa
  module Shared
    module Infrastructure
      module Connectors
        module HttpConnector
          class HttpNetConnector < ::EnviaYa::Shared::Domain::Connectors::HttpConnector
            def execute(uri:, method: ::EnviaYa::Shared::Domain::ValueObjects::HttpMethodValueObject.new('GET'), body: {})
              unless EnviaYa::Config.api_key
                raise StandardError, "api_key has not been added. Please added via EnviaYa::Config.api_key = 'YOUR_API_KEY'"
              end

              unless uri.is_a?(URI)
                raise TypeError, "uri expected URI but got: #{uri.class}"
              end

              unless method.is_a?(::EnviaYa::Shared::Domain::ValueObjects::HttpMethodValueObject)
                raise TypeError, "method expected HttpMethodValueObject but got: #{method.class}"
              end

              unless body.is_a?(Hash)
                raise TypeError, "body expected Hash but got: #{body.class}"
              end
  
              case method.value
              when 'POST'
                return Net::HTTP.post(URI(uri.to_s.concat("?api_key=#{EnviaYa::Config.api_key}")), body.to_json, {
                  'Content-Type': 'application/json'
                })
              end
            end
          end
        end
      end
    end
  end
end
