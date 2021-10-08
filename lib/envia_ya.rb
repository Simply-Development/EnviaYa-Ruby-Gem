require 'singleton'
require_relative './modules/rates/infrastructure/repositories/create_rate_repository/create_rate_http_repository.rb'
require_relative './modules/rates/application/commands/create_rate_command.rb'
require_relative './modules/rates/domain/dtos/create_rate_dto.rb'

class EnviaYa
  include Singleton

  attr_accessor :api_key

  def self.api_key=(api_key)
    instance.api_key = api_key
  end

  def self.api_key
    instance.api_key
  end

  class Rates
    include ::Rates::Infrastructure::Repositories
    include ::Rates::Application::Commands
    include ::Rates::Domain::Dtos
    include ::Shared::Domain::Entities
    include ::Shared::Domain::ValueObjects

    def self.create_rate(create_rate_dto)
      command = CreateRateCommand.new(repository: CreateRateRepository::CreateRateHttpRepository.new)
      command.execute(CreateRateDto.new(
        origin_direction: create_rate_dto[:origin_direction] && DirectionEntity.new(
          full_name: create_rate_dto[:origin_direction][:full_name],
          company: create_rate_dto[:origin_direction][:company],
          direction_1: create_rate_dto[:origin_direction][:direction_1],
          direction_2: create_rate_dto[:origin_direction][:direction_2],
          postal_code: PostalCodeValueObject.new(create_rate_dto[:origin_direction][:postal_code]),
          neighborhood: create_rate_dto[:origin_direction][:neighborhood],
          district: create_rate_dto[:origin_direction][:district],
          city: create_rate_dto[:origin_direction][:city],
          state_code: create_rate_dto[:origin_direction][:state_code],
          country_code: create_rate_dto[:origin_direction][:country_code],
          phone: create_rate_dto[:origin_direction][:phone],
          email: create_rate_dto[:origin_direction][:email]
        ),
        destination_direction: create_rate_dto[:destination_direction] && DirectionEntity.new(
          full_name: create_rate_dto[:destination_direction][:full_name],
          company: create_rate_dto[:destination_direction][:company],
          direction_1: create_rate_dto[:destination_direction][:direction_1],
          direction_2: create_rate_dto[:destination_direction][:direction_2],
          postal_code: PostalCodeValueObject.new(create_rate_dto[:destination_direction][:postal_code]),
          neighborhood: create_rate_dto[:destination_direction][:neighborhood],
          district: create_rate_dto[:destination_direction][:district],
          city: create_rate_dto[:destination_direction][:city],
          state_code: create_rate_dto[:destination_direction][:state_code],
          country_code: create_rate_dto[:destination_direction][:country_code],
          phone: create_rate_dto[:destination_direction][:phone],
          email: create_rate_dto[:destination_direction][:email]
        ),
        shipment: ShipmentEntity.new(
          shipment_type: create_rate_dto[:shipment][:shipment_type] && ShipmentTypeValueObject.new(create_rate_dto[:shipment][:shipment_type]),
          parcels: create_rate_dto[:shipment][:parcels].map { |parcel| ParcelEntity.new(
            quantity: parcel[:quantity],
            weight: parcel[:weight],
            weight_unit: WeightUnitValueObject.new(parcel[:weight_unit]),
            height: parcel[:height],
            length: parcel[:length],
            width: parcel[:width],
            dimension_unit: DimensionUnitValueObject.new(parcel[:dimension_unit])
          ) },
          insured_value: create_rate_dto[:shipment][:insured_value],
          insured_value_currency: create_rate_dto[:shipment][:insured_value_currency],
          content: create_rate_dto[:shipment][:content],
          shipment_date: create_rate_dto[:shipment][:shipment_date],
          carrier: create_rate_dto[:shipment][:carrier],
          carrier_service_code: create_rate_dto[:shipment][:carrier_service_code],
          enviaya_service_code: create_rate_dto[:shipment][:enviaya_service_code],
          enviaya_shipment_number: create_rate_dto[:shipment][:enviaya_shipment_number],
          carrier_shipment_number: create_rate_dto[:shipment][:carrier_shipment_number],
          label: create_rate_dto[:shipment][:label],
          label_format: create_rate_dto[:shipment][:label_format] && LabelFormatValueObject.new(create_rate_dto[:shipment][:label_format]),
          label_file_type: create_rate_dto[:shipment][:label_file_type] && LabelFileTypeValueObject.new(create_rate_dto[:shipment][:label_file_type]),
          label_url: create_rate_dto[:shipment][:label_url],
          rate: create_rate_dto[:shipment][:rate],
          accounts: create_rate_dto[:shipment][:accounts] && AccountsEntity.new(
            enviaya_account: create_rate_dto[:shipment][:accounts][:enviaya_account],
            carrier_account: create_rate_dto[:shipment][:accounts][:carrier_account]
          )
        ),
        accounts: create_rate_dto[:accounts] && AccountsEntity.new(
          enviaya_account: create_rate_dto[:accounts][:enviaya_account],
          carrier_account: create_rate_dto[:accounts][:carrier_account]
        ),
        order_total_amount: create_rate_dto[:order_total_amount],
        intelligent_filtering: create_rate_dto[:intelligent_filtering]
      ))
    end
  end
end
