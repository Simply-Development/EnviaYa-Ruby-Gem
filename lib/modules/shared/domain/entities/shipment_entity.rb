require 'date'
require_relative './parcel_entity.rb'
require_relative './rate_entity.rb'
require_relative './accounts_entity.rb'
require_relative '../value_objects/label_format_value_object.rb'
require_relative '../value_objects/label_file_type_value_object.rb'
require_relative '../value_objects/shipment_type_value_object.rb'

module EnviaYa
  module Shared
    module Domain
      module Entities
        class ShipmentEntity
          attr_reader :shipment_type,
                      :parcels,
                      :insured_value,
                      :insured_value_currency,
                      :content,
                      :shipment_date,
                      :carrier,
                      :carrier_service_code,
                      :enviaya_service_code,
                      :enviaya_shipment_number,
                      :carrier_shipment_number,
                      :label,
                      :label_format,
                      :label_file_type,
                      :label_url,
                      :rate,
                      :accounts
        
          def initialize(
            shipment_type: nil,
            parcels:,
            insured_value: nil,
            insured_value_currency: nil,
            content: nil,
            shipment_date: nil,
            carrier: nil,
            carrier_service_code: nil,
            enviaya_service_code: nil,
            enviaya_shipment_number: nil,
            carrier_shipment_number: nil,
            label: nil,
            label_format: nil,
            label_file_type: nil,
            label_url: nil,
            rate: nil,
            accounts: nil
          )
            unless shipment_type.is_a?(::EnviaYa::Shared::Domain::ValueObjects::ShipmentTypeValueObject) || shipment_type.is_a?(NilClass)
              raise TypeError, "shipment_type expected a ShipmentTypeValueObject but got: #{shipment_type.class}"
            end
    
            raise TypeError, "parcels expected an Array<ParcelEntity> but got: #{parcels.class}" unless parcels.is_a?(Array)
    
            parcels.each do |parcel|
              raise TypeError, "item in parcels array expected to be a ParcelEntity but got: #{parcel.class}" unless parcel.is_a?(::EnviaYa::Shared::Domain::Entities::ParcelEntity)
            end
    
            raise TypeError, "insured_value expected a Float but got: #{insured_value.class}" unless insured_value.class.is_a?(Float) || insured_value.is_a?(NilClass)
            raise TypeError, "insured_value_currency expected a String but got: #{insured_value_currency.class}" if insured_value && !insured_value_currency.is_a?(String)
            raise TypeError, "content expected a String or NilClass but got: #{content.class}" unless content.is_a?(String) || content.is_a?(NilClass)
            raise TypeError, "shipment_date expected a Date or NilClass but got: #{shipment_date.class}" unless shipment_date.is_a?(Date) || shipment_date.is_a?(NilClass)
            raise TypeError, "carrier expected a String or NilClass but got: #{carrier.class}" unless carrier.is_a?(String) || carrier.is_a?(NilClass)
            raise TypeError, "carrier_service_code expected a String or NilClass but got: #{carrier_service_code.class}" unless carrier_service_code.is_a?(String) || carrier_service_code.is_a?(NilClass)
            raise TypeError, "enviaya_service_code expected a String or NilClass but got: #{enviaya_service_code.class}" unless enviaya_service_code.is_a?(String) || enviaya_service_code.is_a?(NilClass)
            raise TypeError, "enviaya_shipment_number expected a String or NilClass but got: #{enviaya_shipment_number.class}" unless enviaya_shipment_number.is_a?(String) || enviaya_shipment_number.is_a?(NilClass)
            raise TypeError, "carrier_shipment_number expected a String or NilClass but got: #{carrier_shipment_number.class}" unless carrier_shipment_number.is_a?(String) || carrier_shipment_number.is_a?(NilClass)
            raise TypeError, "label expected a String or NilClass but got: #{label.class}" unless label.is_a?(String) || label.is_a?(NilClass)
            raise TypeError, "label_format expected a LabelFormatValueObject or NilClass but got: #{label_format.class}" unless label_format.is_a?(::EnviaYa::Shared::Domain::ValueObjects::LabelFormatValueObject) || label_format.is_a?(NilClass)
            raise TypeError, "label_file_type expected a LabelFileTypeValueObject or NilClass but got: #{label_file_type.class}" unless label_file_type.is_a?(::EnviaYa::Shared::Domain::ValueObjects::LabelFileTypeValueObject) || label_file_type.is_a?(NilClass)
            raise TypeError, "label_url expected a String or NilClass but got: #{label_url.class}" unless label_url.is_a?(String) || label_url.is_a?(NilClass)
            raise TypeError, "rate expected a RateEntity or NilClass but got: #{rate.class}" unless rate.is_a?(::EnviaYa::Shared::Domain::Entities::RateEntity) || rate.is_a?(NilClass)
            raise TypeError, "accounts expected a AccountsEntity or NilClass but got: #{accounts.class}" unless accounts.is_a?(::EnviaYa::Shared::Domain::Entities::AccountsEntity) || accounts.is_a?(NilClass)
    
            @shipment_type = shipment_type
            @parcels = parcels
            @insured_value = insured_value
            @insured_value_currency = insured_value_currency
            @content = content
            @shipment_date = shipment_date
            @carrier = carrier
            @carrier_service_code = carrier_service_code
            @enviaya_service_code = enviaya_service_code
            @carrier_shipment_number = carrier_shipment_number
            @label = label
            @label_format = label_format
            @label_file_type = label_file_type
            @label_url = label_url
            @rate = rate
            @accounts = accounts
          end
  
          def to_hash
            {
              shipment_type: @shipment_type.to_s,
              parcels: @parcels.map { |parcel| parcel.to_hash },
              insured_value: @insured_value,
              insured_value_currency: @insured_value_currency,
              content: @content,
              shipment_date: @shipment_date,
              carrier: @carrier,
              carrier_service_code: @carrier_service_code,
              enviaya_service_code: @enviaya_service_code,
              carrier_shipment_number: @carrier_shipment_number,
              label: @label,
              label_format: @label_format,
              label_file_type: @label_file_type.to_s,
              label_url: @label_url,
              rate: @rate,
              accounts: @accounts&.to_hash
            }
          end
        end
      end
    end
  end  
end
