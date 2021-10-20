# EnviaYa Ruby Gem

## Setup

You can install the gem manually

```bash
gem install envia_ya
```

or add it to your Gemfile and use Bundler for installation.


```ruby
gem 'envia_ya'
```

## Usage

### Set API KEY

First you have to set your API KEY to have access to EnviaYa! API.

```ruby
EnviaYa::Config.api_key = YOUR_API_KEY
```

### Rates

#### Rate Shipment

```ruby
repository = EnviaYa::Rates::Infrastructure::Repositories::RatesHttpRepository.new
command = EnviaYa::Rates::Application::Commands::CreateRateCommand.new(repository: repository)
dto = EnviaYa::Rates::Domain::Dtos::CreateRateDto.new(
  origin_direction: EnviaYa::Rates::Domain::Entities::DirectionEntity.new(
    postal_code: EnviaYa::Shared::Domain::ValueObjects::PostalCodeValueObject.new('68050'),
    country_code: 'MX'
  ),
  destination_direction: EnviaYa::Rates::Domain::Entities::DirectionEntity.new(
    postal_code: EnviaYa::Shared::Domain::ValueObjects::PostalCodeValueObject.new('68000'),
    country_code: 'MX'
  ),
  shipment: EnviaYa::Rates::Domain::Entities::ShipmentEntity.new(
    shipment_type: EnviaYa::Shared::Domain::ValueObjects::ShipmentTypeValueObject.new('Package'),
    parcels: [
      EnviaYa::Shared::Domain::Entities::ParcelEntity.new(
        quantity: 1,
        weight: 1.0,
        weight_unit: EnviaYa::Shared::Domain::ValueObjects::WeightUnitValueObject.new('kg'),
        height: 10.0,
        length: 10.0,
        width: 10.0,
        dimension_unit: EnviaYa::Shared::Domain::ValueObjects::DimensionUnitValueObject.new('cm')
      )
    ]
  )
)
command.execute(dto)
```
