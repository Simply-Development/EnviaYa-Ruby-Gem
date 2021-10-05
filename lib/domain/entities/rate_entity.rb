require_relative './surcharge_entity.rb'

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
        carrier:,
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
        raise TypeError, "id expected an Integer or NilClass but got: #{id.class}" unless id.is_a?(Integer) || id.is_a?(NilClass)
        raise TypeError, "date expected a DateTime or NilClass but got: #{date.class}" unless data.is_a?(DateTime) || date.is_a?(NilClass)
        raise TypeError, "carrier expected a String but got: #{carrier.class}" unless carrier.is_a?(String)
        raise TypeError, "carrier_service_name expected a String or NilClass but got: #{carrier_service_name.class}" unless carrier_service_name.is_a?(String) || carrier_service_name.is_a?(NilClass)
        raise TypeError, "carrier_service_code expected a String or NilClass but got: #{carrier_service_code.class}" unless carrier_service_code.is_a?(String) || carrier_service_code.is_a?(NilClass)
        raise TypeError, "carrier_logo_url expected a String or NilClass but got: #{carrier_logo_url.class}" unless carrier_logo_url.is_a?(String) || carrier_logo_url.is_a?(NilClass)
        raise TypeError, "carrier_logo_url_svg expected a String or NilClass but got: #{carrier_logo_url_svg.class}" unless carrier_logo_url_svg.is_a?(String) || carrier_logo_url_svg.is_a?(NilClass)
        raise TypeError, "estimated_delivery expected a DateTime or NilClass but got: #{estimated_delivery.class}" unless estimated_delivery.is_a?(DateTime) || estimated_delivery.is_a?(NilClass)
        raise TypeError, "net_shipping_amount expected a Float or NilClass but got: #{net_shipping_amount.class}" unless net_shipping_amount.is_a?(Float) || net_shipping_amount.is_a?(NilClass)
        raise TypeError, "net_surcharges_amount expected a Float or NilClass but got: #{net_surcharges_amount.class}" unless net_surcharges_amount.is_a?(Float) || net_surcharges_amount.is_a?(NilClass)
        raise TypeError, "net_total_amount expected a Float or NilClass but got: #{net_total_amount.class}" unless net_total_amount.is_a?(Float) || net_total_amount.is_a?(NilClass)
        raise TypeError, "vat_amount expected a Float or NilClass but got: #{vat_amount.class}" unless vat_amount.is_a?(Float) || vat_amount.is_a?(NilClass)
        raise TypeError, "vat_rate expected a Float or NilClass but got: #{vat_rate.class}" unless vat_rate.is_a?(Float) || vat_rate.is_a?(NilClass)
        raise TypeError, "total_amount expected a Float or NilClass but got: #{total_amount.class}" unless total_amount.is_a?(Float) || total_amount.is_a?(NilClass)
        raise TypeError, "public_total_amount expected a Float or NilClass but got: #{public_total_amount.class}" unless public_total_amount.is_a?(Float) || public_total_amount.is_a?(NilClass)
        raise TypeError, "public_total_amount_currency expected a String or NilClass but got: #{public_total_amount_currency.class}" unless public_total_amount_currency.is_a?(String) || public_total_amount_currency.is_a?(NilClass)
        raise TypeError, "currency expected a String or NilClass but got: #{currency.class}" unless currency.is_a?(String) || currency.is_a?(NilClass)

        unless surcharges.is_a?(NilClass)
          raise TypeError, "surcharges expected an Array<SurchargeEntity> or NilClass but got: #{surcharges.class}" unless surcharges.is_a?(Array)

          surcharges.each do |surcharge|
            raise TypeError, "item in surcharges array expected to be a SurchargeEntity but got: #{surcharge.class}" unless surcharge.is_a?(::Domain::Entities::SurchargeEntity)
          end
        end

        raise TypeError, "service_terms expected a String or NilClass but got: #{service_terms.class}" unless service_terms.is_a?(String) || service_terms.is_a?(NilClass)
        raise TypeError, "enviaya_service_name expected a String or NilClass but got: #{enviaya_service_name.class}" unless enviaya_service_name.is_a?(String) || enviaya_service_name.is_a?(NilClass)
        raise TypeError, "enviaya_service_code expected a String or NilClass but got: #{enviaya_service_code.class}" unless enviaya_service_code.is_a?(String) || enviaya_service_code.is_a?(NilClass)

        @id = id
        @date = date
        @carrier = carrier
        @carrier_service_name = carrier_service_name
        @carrier_service_code = carrier_service_code
        @carrier_logo_url = carrier_logo_url
        @carrier_logo_url_svg = carrier_logo_url_svg
        @estimated_delivery = estimated_delivery
        @net_shipping_amount = net_shipping_amount
        @net_surcharges_amount = net_surcharges_amount
        @net_total_amount = net_total_amount
        @vat_amount = vat_amount
        @vat_rate = vat_rate
        @total_amount = total_amount
        @public_total_amount = public_total_amount
        @public_total_amount_currency = public_total_amount_currency
        @currency = currency
        @surcharges = surcharges
        @service_terms = service_terms
        @enviaya_service_name = enviaya_service_name
        @enviaya_service_code = enviaya_service_code
      end
    end
  end
end
