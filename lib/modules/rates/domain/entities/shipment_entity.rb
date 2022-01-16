require 'date'
require_relative '../entities/parcel_entity.rb'
require_relative '../entities/rate_entity.rb'
require_relative '../entities/accounts_entity.rb'
require_relative '../../../shared/domain/value_objects/label_format_value_object.rb'
require_relative '../../../shared/domain/value_objects/label_file_type_value_object.rb'
require_relative '../../../shared/domain/value_objects/shipment_type_value_object.rb'

module EnviaYa
  module Rates
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
            shipment_type:,
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
            unless shipment_type.is_a?(::EnviaYa::Shared::Domain::ValueObjects::ShipmentTypeValueObject)
              raise TypeError, "shipment_type expected a ShipmentTypeValueObject but got: #{shipment_type.class}"
            end

            unless parcels.is_a?(Array)
              raise TypeError, "parcels expected an Array<ParcelEntity> but got: #{parcels.class}"
            end

            raise ArgumentError, 'parcels expected to have at least one element' if parcels.length.zero?
    
            parcels.each do |parcel|
              unless parcel.is_a?(::EnviaYa::Rates::Domain::Entities::ParcelEntity)
                raise TypeError, "item in parcels array expected to be a ParcelEntity but got: #{parcel.class}"
              end
            end
    
            unless insured_value.class.is_a?(Float) || insured_value.is_a?(NilClass)
              raise TypeError, "insured_value expected a Float but got: #{insured_value.class}"
            end

            if insured_value && !insured_value_currency.is_a?(String)
              raise TypeError, "insured_value_currency expected a String but got: #{insured_value_currency.class}"
            end

            unless content.is_a?(String) || content.is_a?(NilClass)
              raise TypeError, "content expected a String or NilClass but got: #{content.class}"
            end

            unless shipment_date.is_a?(Date) || shipment_date.is_a?(NilClass)
              raise TypeError, "shipment_date expected a Date or NilClass but got: #{shipment_date.class}"
            end

            unless carrier.is_a?(String) || carrier.is_a?(NilClass)
              raise TypeError, "carrier expected a String or NilClass but got: #{carrier.class}"
            end

            unless carrier_service_code.is_a?(String) || carrier_service_code.is_a?(NilClass)
              raise TypeError, "carrier_service_code expected a String or NilClass but got: #{carrier_service_code.class}"
            end

            unless enviaya_service_code.is_a?(String) || enviaya_service_code.is_a?(NilClass)
              raise TypeError, "enviaya_service_code expected a String or NilClass but got: #{enviaya_service_code.class}"
            end

            unless enviaya_shipment_number.is_a?(String) || enviaya_shipment_number.is_a?(NilClass)
              raise TypeError, "enviaya_shipment_number expected a String or NilClass but got: #{enviaya_shipment_number.class}"
            end

            unless carrier_shipment_number.is_a?(String) || carrier_shipment_number.is_a?(NilClass)
              raise TypeError, "carrier_shipment_number expected a String or NilClass but got: #{carrier_shipment_number.class}"
            end

            unless label.is_a?(String) || label.is_a?(NilClass)
              raise TypeError, "label expected a String or NilClass but got: #{label.class}"
            end

            unless label_format.is_a?(::EnviaYa::Shared::Domain::ValueObjects::LabelFormatValueObject) || label_format.is_a?(NilClass)
              raise TypeError, "label_format expected a LabelFormatValueObject or NilClass but got: #{label_format.class}"
            end

            unless label_file_type.is_a?(::EnviaYa::Shared::Domain::ValueObjects::LabelFileTypeValueObject) || label_file_type.is_a?(NilClass)
              raise TypeError, "label_file_type expected a LabelFileTypeValueObject or NilClass but got: #{label_file_type.class}"
            end

            unless label_url.is_a?(String) || label_url.is_a?(NilClass)
              raise TypeError, "label_url expected a String or NilClass but got: #{label_url.class}"
            end

            unless rate.is_a?(::EnviaYa::Rates::Domain::Entities::RateEntity) || rate.is_a?(NilClass)
              raise TypeError, "rate expected a RateEntity or NilClass but got: #{rate.class}"
            end

            unless accounts.is_a?(::EnviaYa::Rates::Domain::Entities::AccountsEntity) || accounts.is_a?(NilClass)
              raise TypeError, "accounts expected a AccountsEntity or NilClass but got: #{accounts.class}"
            end
    
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
  
          def to_json
            {
              shipment_type: @shipment_type.value,
              parcels: @parcels.map { |parcel| parcel.to_json },
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
              label_file_type: @label_file_type.value,
              label_url: @label_url,
              rate: @rate,
              accounts: @accounts&.to_json
            }
          end
        end
      end
    end
  end  
end
