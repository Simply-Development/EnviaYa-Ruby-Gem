module EnviaYa
  module Shared
    module Domain
      module ValueObjects
        class DimensionUnitValueObject
          def initialize(dimension_unit)
            unless ['cm', 'in'].include?(dimension_unit)
              raise ArgumentError, "Invalid dimension_unit: #{dimension_unit}"
            end
    
            @value = dimension_unit
          end
  
          def value
            @value
          end
        end
      end
    end
  end
end
