Gem::Specification.new do |s|
  s.name = 'envia_ya'
  s.version = '0.0.4'
  s.summary = 'Ruby implementation of EnviaYa! shipping service.'
  s.authors = ['Simply Development', 'Jorge Castillo']
  s.email = ['hello@simply-development.com', 'j@simply-development.com']
  s.license = 'MIT'
  s.post_install_message = 'Developed with 🧡 by Simply Development'
  s.files = [
    'lib/envia_ya.rb',
    # Infrastructure
    'lib/modules/shared/infrastructure/connectors/http_connector/http_net_connector.rb',
    'lib/modules/rates/infrastructure/repositories/create_rate_repository/create_rate_http_repository.rb',
    # Application
    'lib/modules/rates/application/commands/create_rate_command.rb',
    # Domain
    'lib/modules/shared/domain/connectors/http_connector.rb',
    'lib/modules/shared/domain/value_objects/http_method_value_object.rb',
    'lib/modules/shared/domain/value_objects/http_method_value_object.rb',
    'lib/modules/shared/domain/value_objects/postal_code_value_object.rb',
    'lib/modules/shared/domain/entities/parcel_entity.rb',
    'lib/modules/shared/domain/value_objects/weight_unit_value_object.rb',
    'lib/modules/shared/domain/value_objects/dimension_unit_value_object.rb',
    'lib/modules/shared/domain/entities/rate_entity.rb',
    'lib/modules/shared/domain/entities/surcharge_entity.rb',
    'lib/modules/shared/domain/entities/accounts_entity.rb',
    'lib/modules/shared/domain/value_objects/label_format_value_object.rb',
    'lib/modules/shared/domain/value_objects/label_file_type_value_object.rb',
    'lib/modules/shared/domain/value_objects/shipment_type_value_object.rb',
    'lib/modules/rates/domain/dtos/create_rate_dto.rb',
    'lib/modules/rates/domain/repositories/create_rate_repository.rb',
    'lib/modules/rates/domain/entities/shipment_entity.rb',
    'lib/modules/rates/domain/entities/direction_entity.rb'
  ]
end
