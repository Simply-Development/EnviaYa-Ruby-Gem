require 'json'
require 'net/http'
require 'uri'
require_relative '../../domain/repositories/rates_repository.rb'
require_relative '../../domain/data_transfer_objects/create_rate_dto.rb'
require_relative '../../../shared/domain/value_objects/http_method_value_object.rb'
require_relative '../../../shared/infrastructure/connectors/http_connector/http_net_connector.rb'
require_relative '../../../shared/domain/connectors/http_connector'

module EnviaYa
  module Rates
    module Infrastructure
      module Repositories
        class RatesHttpRepository < ::EnviaYa::Rates::Domain::Repositories::RatesRepository
          def initialize(http_connector: ::EnviaYa::Shared::Infrastructure::Connectors::HttpConnector::HttpNetConnector.new)
            unless http_connector.is_a?(::EnviaYa::Shared::Domain::Connectors::HttpConnector)
              raise TypeError, "http_connector expected HttpConnector but got: #{http_connector.class}"
            end

            @http_connector = http_connector
          end

          def create(create_rate_dto)
            unless create_rate_dto.is_a?(::EnviaYa::Rates::Domain::DataTransferObjects::CreateRateDto)
              raise TypeError, "expected a CreateRateDto but got: #{create_rate_dto.class}"
            end

            response = @http_connector.execute(uri: URI('https://enviaya.com.mx/api/v1/rates'), method: ::EnviaYa::Shared::Domain::ValueObjects::HttpMethodValueObject.new('POST'), body: create_rate_dto.to_json)
            JSON.parse(response.body, symbolize_names: true)
          end
        end
      end
    end
  end
end
