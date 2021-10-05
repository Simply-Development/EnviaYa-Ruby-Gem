require 'json'
require_relative '../../../../domain/repositories/create_rate_repository.rb'
require_relative '../../../../domain/dtos/create_rate_dto.rb'

module Rates
  module Infrastructure
    module Repositories
      module CreateRateRepository
        class CreateRateDummyRepository < ::Rates::Domain::Repositories::CreateRateRepository
          def execute(create_rate_dto)
            raise TypeError, "create_rate_repository expected a CreateRateDto but got: #{create_rate_dto.class}" unless create_rate_dto.is_a?(::Rates::Domain::Dtos::CreateRateDto)
            
            fixtures = File.read('./fixtures.json')
            JSON.parse(fixtures)
          end
        end
      end
    end
  end
end
