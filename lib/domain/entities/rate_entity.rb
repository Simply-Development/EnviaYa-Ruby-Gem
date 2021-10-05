module Domain
  module Entities
    class RateEntity
      attr_reader :id,
                  :date,
                  :carrier,
                  :carrier_service_name,
                  :carrier_service_code,
                  :carrier_logo_url,
                  :carrier_logo_url_svg,
                  :estimated_delivery,
                  :net_shipping_amount,
                  :net_surcharges_amount,
                  :net_total_amount,
                  :vat_amount,
                  :vat_rate,
                  :total_amount,
                  :public_total_amount,
                  :public_total_amount_currency,
                  :currency,
                  :surcharges,
                  :service_terms,
                  :enviaya_service_name,
                  :enviaya_service_code

      def initialize(
        id: nil,
        date: nil,
        carrir:,
        carrier_service_name: nil,
        carrier_service_code: nil,
        carrier_logo_url: nil,
        carrier_logo_url_svg: nil,
        estimated_delivery: nil,
        net_shipping_amount: nil,
        net_surcharges_amount: nil,
        net_total_amount: nil,
        vat_amount: nil,
        vat_rate: nil,
        total_amount: nil,
        public_total_amount: nil,
        public_total_amount_currency: nil,
        currency: nil,
        surcharges: nil,
        service_terms: nil,
        enviaya_service_name: nil,
        enviaya_service_code: nil
      )
      end
    end
  end
end
