require_relative '../dtos/create_rate_dto.rb'

module EnviaYa
  module Rates
    module Domain
      module Repositories
        class CreateRateRepository
          def execute(create_rate_dto)
            raise NotImplementedError, "method not implemented yet"
          end
        end
      end
    end
  end
end
