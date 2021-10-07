require_relative '../../domain/dtos/create_rate_dto.rb'
require_relative '../../domain/repositories/create_rate_repository.rb'

module Rates
  module Application
    module Commands
      class CreateRateCommand
        def initialize(repository:)
          raise TypeError, "repository expected CreateRateRepository but got: #{repository.class}" unless repository.is_a?(::Rates::Domain::Repositories::CreateRateRepository)
          
          @repository = repository
        end

        def execute(create_rate_dto)
          raise TypeError, "create_rate_dto expected CreateRateDto but got: #{create_rate_dto.class}" unless create_rate_dto.is_a?(::Rates::Domain::Dtos::CreateRateDto)

          @repository.execute(create_rate_dto)
        end
      end
    end
  end
end
