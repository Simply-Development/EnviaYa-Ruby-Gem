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
        self.origin_direction = origin_direction
        self.destination_direction = destination_direction
        self.shipment = shipment
        self.accounts = accounts
        self.order_total_amount = order_total_money
        self.intelligent_filtering = intelligent_filtering
      end
    end
  end
end
