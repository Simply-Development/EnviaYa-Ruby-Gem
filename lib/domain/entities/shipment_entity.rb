require_relative './parcel_entity.rb'

module Domain
  module Entities
    class ShipmentEntity
      attr_reader :shipment_type
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
        content:,
        shipment_date: nil,
        carrier: nil,
        carrier_service_code:,
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
        unless shipment_type.is_a?(::Domain::ValueObject::ShipmentTypeValueObject) || shipment_type.is_a?(NilClass)
          raise TypeError, "shipment_type expected a ShipmentTypeValueObject but got: #{shipment_type.class}"
        end

        raise TypeError, "parcels expected an Array<ParcelEntity> but got: #{parcels.class}" unless parcels.is_a?(Array)

        parcels.each do |parcel|
          raise TypeError, "item in parcels array expected to be a ParcelEntity but got: #{parcel.class}" unless parcel.is_a?(::Domain::Entities::ParcelEntity)
        end

        raise TypeError, "insured_value expected a Float but got: #{insured_value.class}" unless insured_value.class.is_a?(Float) || insured_value.is_a?(NilClass)
        raise TypeError, "insured_value_currency expected a String but got: #{insured_value_currency.class}" if insured_value && !insured_value_currency.is_a?(String)
        raise TypeError, "content expected a String but got: #{content.class}" unless content.is_a?(String) || content.is_a?(NilClass)


        self.shipment_type = shipment_type
        self.parcels = parcels
        self.insured_value = insured_value
        self.insured_value_currency = insured_value_currency
        self.content = content
        self.shipment_date = shipment_date
        self.carrier = carrier
        self.carrier_service_code = carrier_service_code
        self.enviaya_service_code = enviaya_service_code
        self.carrier_shipment_number = carrier_shipment_number
        self.label = label
        self.label_format = label_format
        self.label_file_type = label_file_type
        self.label_url = label_url
        self.rate = rate
        self.accounts = accounts
      end
    end
  end
end
