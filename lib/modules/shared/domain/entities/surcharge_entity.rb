module Shared
  module Domain
    module Entities
      class SurchargeEntity
        attr_reader :name,
                    :net_amount,
                    :vat_amount,
                    :vat_rate,
                    :total_amount
  
        def initialize(
          name: nil,
          net_amount: nil,
          vat_amount: nil,
          vat_rate: nil,
          total_amount: nil
        )
          raise TypeError, "name expected a String or NilClass but got: #{name.class}" unless name.is_a?(String) || name.is_a?(NilClass)
          raise TypeError, "net_amount expected a Float or NilClass but got: #{net_amount.class}" unless net_amount.is_a?(Float) || net_amount.is_a?(NilClass)
          raise TypeError, "vat_amount expected a Float or NilClass but got: #{vat_amount.class}" unless vat_amount.is_a?(Float) || vat_amount.is_a?(NilClass)
          raise TypeError, "vat_rate expected a Float or NilClass but got: #{vat_rate.class}" unless vat_rate.is_a?(Float) || vat_rate.is_a?(NilClass)
          raise TypeError, "total_amount, expected a Float or NilClass but got: #{total_amount.class}" unless total_amount.is_a?(Float) || total_amount.is_a?(NilClass)
  
          @name = name
          @net_amount = net_amount
          @vat_amount = vat_amount
          @vat_rate = vat_rate
          @total_amount = total_amount
        end
      end
    end
  end
end
