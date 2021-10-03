require_relative '../value_objects/postal_code_value_object.rb'

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
        full_name:,
        company: nil,
        direction_1:,
        direction_2: nil,
        postal_code:,
        neighborhood: nil,
        district: nil,
        city:,
        state_code: nil,
        country_code:,
        phone:,
        email: nil
      )
        raise TypeError, "full_name expected a String or NilClass but got: #{full_name.class}" unless full_name.is_a?(String)
        raise TypeError, "company expected a String or NilClass but got: #{company.class}" unless company.is_a?(String) || company.is_a?(NilClass)
        raise TypeError, "direction_1 expected a String but got: #{direction_1.class}" unless direction_1.is_a?(String)
        raise TypeError, "direction_1 expected a String or NilClass but got: #{direction_2.class}" unless direction_2.is_a?(String) || direction_2.is_a?(NilClass)
        raise TypeError, "postal_code expected a PostalCodeValueObject but got: #{postal_code.class}" unless postal_code.is_a?(::Domain::ValueObjects::PostalCodeValueObject)
        raise TypeError, "neighborhood expected a String or NilClass but got: #{neighborhood.class}" unless neighborhood.is_a?(String) || neighborhood.is_a?(NilClass)
        raise TypeError, "district expected a String or NilClass but got: #{district.class}" unless district.is_a?(String) || district.is_a?(NilClass)
        raise TypeError, "city expected a String but got: #{city.class}" unless city.is_a?(String)
        raise TypeError, "state_code expected a String or NilClass but got: #{state_code.class}" unless state_code.is_a?(String) || state_code.is_a?(NilClass)
        raise TypeError, "country_code expected a String but got: #{country_code.class}" unless country_code.is_a?(String)
        raise TypeError, "phone expected a String but got: #{phone.class}" unless phone.is_a?(String)
        raise TypeError, "email expected a String or NilClass but got: #{email.class}" unless email.is_a?(String) || email.is_a?(NilClass)
    
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
    end    
  end
end
