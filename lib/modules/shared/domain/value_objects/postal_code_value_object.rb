module EnviaYa
  module Shared
    module Domain
      module ValueObjects
        class PostalCodeValueObject
          def initialize(postal_code)
            unless postal_code.match(/\A[0-9]{5}\z/)
              raise ArgumentError, "Invalid postal code: #{postal_code}"
            end
        
            @value = postal_code
          end
  
          def value
            @value
          end
        end
      end
    end
  end
end
