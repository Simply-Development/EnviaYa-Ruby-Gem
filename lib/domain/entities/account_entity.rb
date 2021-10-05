module Domain
  module Entities
    class AccountEntity
      attr_reader :enviaya_account,
                  :carrier_account

      def initialize(
        enviaya_account: nil,
        carrier_account: nil
      )
        raise TypeError, "enviaya_account expected a String or NilClass but got: #{enviaya_account.class}" unless enviaya_account.is_a?(String) || enviaya_account.is_a?(NilClass)
        raise TypeError, "carrier_account expected a String or NilClass but got: #{carrier_account.class}" unless carrier_account.is_a?(String) || carrier_account.is_a?(NilClass)

        @enviaya_account = enviaya_account
        @carrier_account = carrier_account
      end
    end
  end
end
