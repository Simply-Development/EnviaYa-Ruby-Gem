require_relative '../../../shared/domain/entities/direction_entity.rb'
require_relative '../../../shared/domain/entities/shipment_entity.rb'
require_relative '../../../shared/domain/entities/accounts_entity.rb'

module EnviaYa
  module Rates
    module Domain
      module Dtos
        class CreateRateDto
          attr_reader :origin_direction,
                      :destination_direction,
                      :shipment,
                      :accounts,
                      :order_total_amount,
                      :intelligent_filtering
        
          def initialize(
            origin_direction: nil,
            destination_direction: nil,
            shipment:,
            accounts: nil,
            order_total_amount: nil,
            intelligent_filtering: nil
          )
            raise TypeError, "origin_direction expected a DirectionEntity or NilClass but got: #{origin_direction.class}" unless origin_direction.is_a?(::EnviaYa::Shared::Domain::Entities::DirectionEntity) || origin_direction.is_a?(NilClass)
            raise TypeError, "destination_direction expected a DirectionEntity or NilClass but got: #{destination_direction.class}" unless destination_direction.is_a?(::EnviaYa::Shared::Domain::Entities::DirectionEntity) || destination_direction.is_a?(NilClass)
            raise TypeError, "shipment expected a DirectionEntity but got: #{shipment.class}" unless shipment.is_a?(::EnviaYa::Shared::Domain::Entities::ShipmentEntity)
            raise TypeError, "accounts expected an AccountsEntity or NilClass but got: #{accounts.class}" unless accounts.is_a?(::EnviaYa::Shared::Domain::Entities::AccountsEntity) || accounts.is_a?(NilClass)
            raise TypeError, "order_total_amount expected an Integer or NilClass but got: #{order_total_amount.class}" unless order_total_amount.is_a?(Integer) || order_total_amount.is_a?(NilClass)
            raise TypeError, "intelligent_filtering expected a TrueClass, FalseClass or NilClass but got: #{intelligent_filtering.class}" unless intelligent_filtering.is_a?(TrueClass) || intelligent_filtering.is_a?(FalseClass) || intelligent_filtering.is_a?(NilClass)
    
            @origin_direction = origin_direction
            @destination_direction = destination_direction
            @shipment = shipment
            @accounts = accounts
            @order_total_amount = order_total_amount
            @intelligent_filtering = intelligent_filtering
          end
  
          def to_hash
            {
              origin_direction: @origin_direction&.to_hash,
              destination_direction: @destination_direction&.to_hash,
              shipment: @shipment.to_hash,
              accounts: @accounts&.to_hash,
              order_total_amount: @order_total_amount,
              intelligent_filtering: @intelligent_filtering,
            }
          end
        end
      end
    end
  end
end
