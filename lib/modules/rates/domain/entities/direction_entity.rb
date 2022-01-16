require_relative '../../../shared/domain/value_objects/postal_code_value_object.rb'

module EnviaYa
  module Rates
    module Domain
      module Entities
        class DirectionEntity
          attr_reader :full_name,
                      :company,
                      :direction_1,
                      :direction_2,
                      :postal_code,
                      :neighborhood,
                      :district,
                      :city,
                      :state_code,
                      :country_code,
                      :phone,
                      :emai
        
          def initialize(
            full_name: nil,
            company: nil,
            direction_1: nil,
            direction_2: nil,
            postal_code:,
            neighborhood: nil,
            district: nil,
            city: nil,
            state_code: nil,
            country_code:,
            phone: nil,
            email: nil
          )
            unless full_name.is_a?(String) || full_name.is_a?(NilClass)
              raise TypeError, "full_name expected a String or NilClass but got: #{full_name.class}"
            end

            unless company.is_a?(String) || company.is_a?(NilClass)
              raise TypeError, "company expected a String or NilClass but got: #{company.class}"
            end

            unless direction_1.is_a?(String) || direction_1.is_a?(NilClass)
              raise TypeError, "direction_1 expected a String or NilClass but got: #{direction_1.class}"
            end

            unless direction_2.is_a?(String) || direction_2.is_a?(NilClass)
              raise TypeError, "direction_1 expected a String or NilClass but got: #{direction_2.class}"
            end

            unless postal_code.is_a?(::EnviaYa::Shared::Domain::ValueObjects::PostalCodeValueObject)
              raise TypeError, "postal_code expected a PostalCodeValueObject but got: #{postal_code.class}"
            end

            unless neighborhood.is_a?(String) || neighborhood.is_a?(NilClass)
              raise TypeError, "neighborhood expected a String or NilClass but got: #{neighborhood.class}"
            end

            unless district.is_a?(String) || district.is_a?(NilClass)
              raise TypeError, "district expected a String or NilClass but got: #{district.class}"
            end

            unless city.is_a?(String) || city.is_a?(NilClass)
              raise TypeError, "city expected a String or NilClass but got: #{city.class}"
            end

            unless state_code.is_a?(String) || state_code.is_a?(NilClass)
              raise TypeError, "state_code expected a String or NilClass but got: #{state_code.class}"
            end

            unless country_code.is_a?(String)
              raise TypeError, "country_code expected a String but got: #{country_code.class}"
            end

            unless phone.is_a?(String) || phone.is_a?(NilClass)
              raise TypeError, "phone expected a String or NilClass but got: #{phone.class}"
            end

            unless email.is_a?(String) || email.is_a?(NilClass)
              raise TypeError, "email expected a String or NilClass but got: #{email.class}"
            end
            
            @full_name = full_name
            @company = company
            @direction_1 = direction_1
            @direction_2 = direction_2
            @postal_code = postal_code
            @neighborhood = neighborhood
            @district = district
            @city = city
            @state_code = state_code
            @country_code = country_code
            @phone = phone
            @email = email
          end
  
          def to_json
            {
              full_name: @full_name,
              company: @company,
              direction_1: @direction_1,
              direction_2: @direction_2,
              postal_code: @postal_code.value,
              neighborhood: @neighborhood,
              district: @district,
              city: @city,
              state_code: @state_code,
              country_code: @country_code,
              phone: @phone,
              email: @email
            }
          end
        end    
      end
    end
  end
end
