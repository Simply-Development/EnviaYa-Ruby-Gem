module EnviaYa
  module Rates
    module Domain
      module Entities
        class AccountsEntity
          attr_reader :enviaya_account,
                      :carrier_account
    
          def initialize(
            enviaya_account: nil,
            carrier_account: nil
          )
            unless enviaya_account.is_a?(String) || enviaya_account.is_a?(NilClass)
              raise TypeError, "enviaya_account expected a String or NilClass but got: #{enviaya_account.class}"
            end

            unless carrier_account.is_a?(String) || carrier_account.is_a?(NilClass)
              raise TypeError, "carrier_account expected a String or NilClass but got: #{carrier_account.class}"
            end
    
            @enviaya_account = enviaya_account
            @carrier_account = carrier_account
          end
  
          def to_json
            {
              enviaya_account: @enviaya_account,
              carrier_account: @carrier_account
            }
          end
        end
      end
    end
  end
end
