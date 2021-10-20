require_relative '../../domain/dtos/create_rate_dto.rb'
require_relative '../../domain/repositories/rates_repository.rb'

module EnviaYa
  module Rates
    module Application
      module Commands
        class CreateRateCommand
          def initialize(repository:)
            raise TypeError, "repository expected CreateRateRepository but got: #{repository.class}" unless repository.is_a?(::EnviaYa::Rates::Domain::Repositories::RatesRepository)
            
            @repository = repository
          end
  
          def execute(create_rate_dto)
            raise TypeError, "expected CreateRateDto but got: #{create_rate_dto.class}" unless create_rate_dto.is_a?(::EnviaYa::Rates::Domain::Dtos::CreateRateDto)
  
            @repository.create(create_rate_dto)
          end
        end
      end
    end
  end
end
