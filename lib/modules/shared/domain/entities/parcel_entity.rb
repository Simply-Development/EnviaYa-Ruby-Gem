require_relative '../value_objects/weight_unit_value_object.rb'
require_relative '../value_objects/dimension_unit_value_object.rb'

module Shared
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
          raise TypeError, "quantity expected an Integer but got: #{quantity.class}" unless quantity.is_a?(Integer)
          raise TypeError, "weight expected a Float but got: #{weight.class}" unless weight.is_a?(Float)
          raise TypeError, "weight_unit expected a WeightUnitValueObject but got: #{weight_unit.class}" unless weight_unit.is_a?(::Shared::Domain::ValueObjects::WeightUnitValueObject)
          raise TypeError, "height expected a Float but got: #{height.class}" unless height.is_a?(Float)
          raise TypeError, "length expected a Float but got: #{length.class}" unless length.is_a?(Float)
          raise TypeError, "width expected a Float but got: #{width.class}" unless width.is_a?(Float)
          raise TypeError, "dimension_unit expected a DimensionUnitValueObject but got: #{dimension_unit}" unless dimension_unit.is_a?(::Shared::Domain::ValueObjects::DimensionUnitValueObject)
        
          @quantity = quantity
          @weight = weight
          @weight_unit = weight_unit
          @height = height
          @length = length
          @width = width
          @dimension_unit = dimension_unit
        end

        def to_hash
          {
            quantity: @quantity,
            weight: @weight,
            weight_unit: @weight_unit.to_s,
            height: @height,
            length: @length,
            width: @width,
            dimension_unit: @dimension_unit.to_s
          }
        end
      end
    end
  end
end
