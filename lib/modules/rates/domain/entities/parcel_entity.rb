require_relative '../../../shared/domain/value_objects/weight_unit_value_object.rb'
require_relative '../../../shared/domain/value_objects/dimension_unit_value_object.rb'

module EnviaYa
  module Rates
    module Domain
      module Entities
        class ParcelEntity
          attr_reader :quantity,
                      :weight,
                      :weight_unit,
                      :height,
                      :length,
                      :width,
                      :dimension_unit
    
          def initialize(
            quantity:,
            weight:,
            weight_unit:,
            height:,
            length:,
            width:,
            dimension_unit:
          )
            unless quantity.is_a?(Integer)
              raise TypeError, "quantity expected an Integer but got: #{quantity.class}"
            end

            unless weight.is_a?(Float)
              raise TypeError, "weight expected a Float but got: #{weight.class}"
            end

            unless weight_unit.is_a?(::EnviaYa::Shared::Domain::ValueObjects::WeightUnitValueObject)
              raise TypeError, "weight_unit expected a WeightUnitValueObject but got: #{weight_unit.class}"
            end

            unless height.is_a?(Float)
              raise TypeError, "height expected a Float but got: #{height.class}"
            end

            unless length.is_a?(Float)
              raise TypeError, "length expected a Float but got: #{length.class}"
            end

            unless width.is_a?(Float)
              raise TypeError, "width expected a Float but got: #{width.class}"
            end

            unless dimension_unit.is_a?(::EnviaYa::Shared::Domain::ValueObjects::DimensionUnitValueObject)
              raise TypeError, "dimension_unit expected a DimensionUnitValueObject but got: #{dimension_unit}"
            end
          
            @quantity = quantity
            @weight = weight
            @weight_unit = weight_unit
            @height = height
            @length = length
            @width = width
            @dimension_unit = dimension_unit
          end
  
          def to_json
            {
              quantity: @quantity,
              weight: @weight,
              weight_unit: @weight_unit.value,
              height: @height,
              length: @length,
              width: @width,
              dimension_unit: @dimension_unit.value
            }
          end
        end
      end
    end
  end
end
