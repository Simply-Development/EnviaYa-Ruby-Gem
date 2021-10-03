module Domain
  module ValueObjects
    class DimensionUnitValueObject
      def initialize(dimension_unit)
        unless ['cm', 'in'].include?(dimension_unit)
          raise ArgumentError, "Invalid dimension_unit: #{dimension_unit}"
        end

        @value = dimension_unit
      end
    end
  end
end
