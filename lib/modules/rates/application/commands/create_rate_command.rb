require_relative '../../domain/data_transfer_objects/create_rate_dto.rb'
require_relative '../../domain/repositories/rates_repository.rb'

module EnviaYa
  module Rates
    module Application
      module Commands
        class CreateRateCommand
          def initialize(rates_repository:)
            unless rates_repository.is_a?(::EnviaYa::Rates::Domain::Repositories::RatesRepository)
              raise TypeError, "rates_repository expected CreateRateRepository but got: #{rates_repository.class}"
            end
            
            @rates_repository = rates_repository
          end
  
          def execute(create_rate_dto)
            unless create_rate_dto.is_a?(::EnviaYa::Rates::Domain::DataTransferObjects::CreateRateDto)
              raise TypeError, "expected CreateRateDto but got: #{create_rate_dto.class}"
            end

            @rates_repository.create(create_rate_dto)
          end
        end
      end
    end
  end
end
