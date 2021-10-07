require 'json'
require 'net/http'
require 'uri'
require_relative '../../../../shared/infrastructure/connectors/http_connector/http_net_connector.rb'
require_relative '../../../domain/repositories/create_rate_repository.rb'
require_relative '../../../domain/dtos/create_rate_dto.rb'
require_relative '../../../../shared/domain/value_objects/http_method_value_object.rb'

module Rates
  module Infrastructure
    module Repositories
      module CreateRateRepository
        class CreateRateHttpRepository < ::Rates::Domain::Repositories::CreateRateRepository
          def initialize
            @http_connector = ::Shared::Infrastructure::Connectors::HttpConnector::HttpNetConnector.new
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
