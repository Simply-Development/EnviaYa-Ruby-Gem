module EnviaYa
  module Shared
    module Domain
      module ValueObjects
        class ShipmentTypeValueObject
          def initialize(shipment_type)
            unless ['Document', 'Package'].include?(shipment_type)
              raise ArgumentError, "Invalid shipment_type: #{shipment_type}"
            end
    
            @value = shipment_type
          end
  
          def value
            @value
          end
        end
      end
    end
  end
end
