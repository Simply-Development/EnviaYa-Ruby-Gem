require 'json'
require 'net/http'
require 'uri'
require_relative '../../../domain/repositories/create_rate_repository.rb'
require_relative '../../../domain/dtos/create_rate_dto.rb'
require_relative '../../../../shared/domain/connectors/http_connector.rb'

module Rates
  module Infrastructure
    module Repositories
      module CreateRateRepository
        class CreateRateHttpRepository < ::Rates::Domain::Repositories::CreateRateRepository
          def initialize(http_connector:)
            raise TypeError, "http_connector expected HttpConnector but got: #{http_connector.class}" unless http_connector.is_a?(::Shared::Domain::Connectors::HttpConnector)

            @http_connector = http_connector
          end

          def execute(create_rate_dto)
            raise TypeError, "create_rate_repository expected a CreateRateDto but got: #{create_rate_dto.class}" unless create_rate_dto.is_a?(::Rates::Domain::Dtos::CreateRateDto)

            @http_connector.execute(URI('https://enviaya.com.mx/api/v1/rates'), method: ::Shared::Domain::ValueObjects::HttpMethodValueObject.new('POST'), body: create_rate_dto.to_hash)
          end
        end
      end
    end
  end
end
