module EnviaYa
  module Shared
    module Domain
      module ValueObjects
        class WeightUnitValueObject
          def initialize(weight_unit)
            unless ['kg', 'lbs'].include?(weight_unit)
              raise ArgumentError, "Invalid weight_unit: #{weight_unit}"
            end
    
            @value = weight_unit
          end
  
          def value
            @value
          end
        end
      end
    end
  end
end
