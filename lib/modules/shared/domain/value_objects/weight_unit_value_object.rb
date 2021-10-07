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

        def to_s
          @value
        end
      end
    end
  end
end
