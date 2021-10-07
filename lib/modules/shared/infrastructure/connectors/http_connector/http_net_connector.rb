require 'json'
require 'net/http'
require 'uri'
require_relative '../../../domain/value_objects/http_method_value_object.rb'
require_relative '../../../domain/connectors/http_connector.rb'

module Shared
  module Infrastructure
    module Connectors
      module HttpConnector
        class HttpNetConnector < ::Shared::Domain::Connectors::HttpConnector
          def execute(uri, method: ::Shared::Domain::ValueObjects::HttpMethodValueObject.new('GET'), body: {})
            raise TypeError, "uri expected URI but got: #{uri.class}" unless uri.is_a?(URI)
            raise TypeError, "method expected HttpMethodValueObject but got: #{method.class}" unless method.is_a?(::Shared::Domain::ValueObjects::HttpMethodValueObject)
            raise TypeError, "body expected Hash but got: #{body.class}" unless body.is_a?(Hash)

            case method.to_s
            when 'POST'
              return Net::HTTP.post(uri, body.to_json, {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer '
              })
            end
          end
        end
      end
    end
  end
end
