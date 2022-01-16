module EnviaYa
  module Rates
    module Domain
      module DataTransferObjects
        class CreateRateDto
          attr_reader :origin_direction,
                      :destination_direction,
                      :shipment,
                      :accounts,
                      :order_total_amount,
                      :intelligent_filtering
        
          def initialize(
            origin_direction:,
            destination_direction:,
            shipment:,
            accounts: nil,
            order_total_amount: nil,
            intelligent_filtering: nil
          )
            unless origin_direction.is_a?(::EnviaYa::Rates::Domain::Entities::DirectionEntity)
              raise TypeError, "origin_direction expected a DirectionEntity but got: #{origin_direction.class}"
            end

            unless destination_direction.is_a?(::EnviaYa::Rates::Domain::Entities::DirectionEntity)
              raise TypeError, "destination_direction expected a DirectionEntity but got: #{destination_direction.class}"
            end

            unless shipment.is_a?(::EnviaYa::Rates::Domain::Entities::ShipmentEntity)
              raise TypeError, "shipment expected ShipmentEntity but got: #{shipment.class}"
            end

            unless accounts.is_a?(::EnviaYa::Rates::Domain::Entities::AccountsEntity) || accounts.is_a?(NilClass)
              raise TypeError, "accounts expected an AccountsEntity or NilClass but got: #{accounts.class}"
            end

            unless order_total_amount.is_a?(Integer) || order_total_amount.is_a?(NilClass)
              raise TypeError, "order_total_amount expected an Integer or NilClass but got: #{order_total_amount.class}"
            end

            unless intelligent_filtering.is_a?(TrueClass) || intelligent_filtering.is_a?(FalseClass) || intelligent_filtering.is_a?(NilClass)
              raise TypeError, "intelligent_filtering expected a TrueClass, FalseClass or NilClass but got: #{intelligent_filtering.class}"
            end
    
            @origin_direction = origin_direction
            @destination_direction = destination_direction
            @shipment = shipment
            @accounts = accounts
            @order_total_amount = order_total_amount
            @intelligent_filtering = intelligent_filtering
          end

          def to_json
            {
              origin_direction: @origin_direction&.to_json,
              destination_direction: @destination_direction&.to_json,
              shipment: @shipment.to_json,
              accounts: @accounts&.to_json,
              order_total_amount: @order_total_amount,
              intelligent_filtering: @intelligent_filtering,
            }
          end
        end
      end
    end
  end
end
