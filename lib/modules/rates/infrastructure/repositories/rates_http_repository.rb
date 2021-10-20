require 'json'
require 'net/http'
require 'uri'
require_relative '../../../shared/infrastructure/connectors/http_connector/http_net_connector.rb'
require_relative '../../domain/repositories/rates_repository.rb'
require_relative '../../domain/dtos/create_rate_dto.rb'
require_relative '../../../shared/domain/value_objects/http_method_value_object.rb'

module EnviaYa
  module Rates
    module Infrastructure
      module Repositories
        class RatesHttpRepository < ::EnviaYa::Rates::Domain::Repositories::RatesRepository
          def initialize
            @http_connector = ::EnviaYa::Shared::Infrastructure::Connectors::HttpConnector::HttpNetConnector.new
          end

          def create(create_rate_dto)
            raise TypeError, "expected a CreateRateDto but got: #{create_rate_dto.class}" unless create_rate_dto.is_a?(::EnviaYa::Rates::Domain::Dtos::CreateRateDto)

            response = @http_connector.execute(URI('https://enviaya.com.mx/api/v1/rates'), method: ::EnviaYa::Shared::Domain::ValueObjects::HttpMethodValueObject.new('POST'), body: create_rate_dto.to_hash)
            JSON.parse(response.body, symbolize_names: true)
          end
        end
      end
    end
  end
end
