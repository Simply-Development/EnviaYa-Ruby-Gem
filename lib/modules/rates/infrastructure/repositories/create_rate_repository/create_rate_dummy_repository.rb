require 'json'
require_relative '../../../domain/repositories/create_rate_repository.rb'
require_relative '../../../domain/dtos/create_rate_dto.rb'

module EnviaYa
  module Rates
    module Infrastructure
      module Repositories
        module CreateRateRepository
          class CreateRateDummyRepository < ::EnviaYa::Rates::Domain::Repositories::CreateRateRepository
            def execute(create_rate_dto)
              raise TypeError, "create_rate_repository expected a CreateRateDto but got: #{create_rate_dto.class}" unless create_rate_dto.is_a?(::EnviaYa::Rates::Domain::Dtos::CreateRateDto)
              
              return {
                "warning": [
                  "Lo sentimos, el envío no se puede realizar con iVoy por el momento",
                  "Aviso: Has usado más del 75% de tu crédito autorizado. Te recomendamos revisar y pagar tus facturas pendientes de tal modo que tengas crédito disponible hasta el siguiente ciclo de facturación."
                ],
                "dhl": [],
                "fedex": [],
                "redpack": [
                  {
                    "rate_id": "71003",
                    "shipment_id": "6584",
                    "dynamic_service_name": "Día siguiente",
                    "date": "2018-10-01T05:02:26.724-05:00",
                    "carrier": "redpack",
                    "carrier_service_name": "EXPRESS",
                    "carrier_service_code": "1",
                    "carrier_logo_url": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/redpack.png",
                    "carrier_logo_url_svg": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/redpack.svg",
                    "estimated_delivery": "2018-10-02 00:00",
                    "net_shipping_amount": 268,
                    "net_surcharges_amount": 75,
                    "net_total_amount": 343,
                    "vat_amount": 54.88,
                    "vat_rate": 16,
                    "total_amount": 397.88,
                    "currency": "MXN",
                    "list_total_amount": 397.88,
                    "list_total_amount_currency": "MXN",
                    "subsidy_total_amount": 0,
                    "service_terms": "",
                    "surcharges_break_down": [
                      {
                        "carrier_surcharge_name": "Insurance",
                        "surcharge_net_amount": 75,
                        "surcharge_vat": 12,
                        "surcharge_total": 87
                      }
                    ],
                    "enviaya_service_name": "TBD",
                    "enviaya_service_code": "TBD"
                  },
                  {
                    "rate_id": "71004",
                    "shipment_id": "6584",
                    "dynamic_service_name": "Entrega en 2 días",
                    "date": "2018-10-01T05:02:26.738-05:00",
                    "carrier": "redpack",
                    "carrier_service_name": "METROPOLITANO",
                    "carrier_service_code": "4",
                    "carrier_logo_url": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/redpack.png",
                    "carrier_logo_url_svg": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/redpack.svg",
                    "estimated_delivery": "2018-10-03 00:00",
                    "net_shipping_amount": 110.24,
                    "net_surcharges_amount": 75,
                    "net_total_amount": 185.24,
                    "vat_amount": 29.64,
                    "vat_rate": 16,
                    "total_amount": 214.88,
                    "currency": "MXN",
                    "list_total_amount": 214.88,
                    "list_total_amount_currency": "MXN",
                    "subsidy_total_amount": 0,
                    "service_terms": "",
                    "surcharges_break_down": [
                      {
                        "carrier_surcharge_name": "Insurance",
                        "surcharge_net_amount": 75,
                        "surcharge_vat": 12,
                        "surcharge_total": 87
                      }
                    ],
                    "enviaya_service_name": "TBD",
                    "enviaya_service_code": "TBD"
                  }
                ],
                "ups": [
                  {
                    "rate_id": "71006",
                    "shipment_id": "6584",
                    "dynamic_service_name": "Día siguiente",
                    "date": "2018-10-01T05:02:34.020-05:00",
                    "carrier": "ups",
                    "carrier_service_name": "UPS Saver",
                    "carrier_service_code": "65",
                    "carrier_logo_url": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/ups.png",
                    "carrier_logo_url_svg": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/ups.svg",
                    "estimated_delivery": "2018-10-02",
                    "net_shipping_amount": 249.03,
                    "net_surcharges_amount": 45,
                    "net_total_amount": 294.03,
                    "vat_amount": 47.05,
                    "vat_rate": 16,
                    "total_amount": 341.08,
                    "currency": "MXN",
                    "list_total_amount": 344,
                    "list_total_amount_currency": "MXN",
                    "subsidy_total_amount": 0,
                    "service_terms": "",
                    "surcharges_break_down": [
                      {
                        "carrier_surcharge_name": "Insurance",
                        "surcharge_net_amount": 45,
                        "surcharge_vat": 7.2,
                        "surcharge_total": 52.2
                      }
                    ],
                    "enviaya_service_name": nil,
                    "enviaya_service_code": nil
                  },
                  {
                    "rate_id": "71007",
                    "shipment_id": "6584",
                    "dynamic_service_name": "Día siguiente (Entrega 08:30)",
                    "date": "2018-10-01T05:02:34.034-05:00",
                    "carrier": "ups",
                    "carrier_service_name": "UPS Worldwide Express Plus",
                    "carrier_service_code": "54",
                    "carrier_logo_url": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/ups.png",
                    "carrier_logo_url_svg": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/ups.svg",
                    "estimated_delivery": "2018-10-02 08:30",
                    "net_shipping_amount": 346.15,
                    "net_surcharges_amount": 45,
                    "net_total_amount": 391.15,
                    "vat_amount": 62.58,
                    "vat_rate": 16,
                    "total_amount": 453.73,
                    "currency": "MXN",
                    "list_total_amount": 457.79,
                    "list_total_amount_currency": "MXN",
                    "subsidy_total_amount": 0,
                    "service_terms": "",
                    "surcharges_break_down": [
                      {
                        "carrier_surcharge_name": "Insurance",
                        "surcharge_net_amount": 45,
                        "surcharge_vat": 7.2,
                        "surcharge_total": 52.2
                      }
                    ],
                    "enviaya_service_name": "TBD",
                    "enviaya_service_code": "TBD"
                  },
                  {
                    "rate_id": "71008",
                    "shipment_id": "6584",
                    "dynamic_service_name": "Día siguiente (Entrega 10:30)",
                    "date": "2018-10-01T05:02:34.048-05:00",
                    "carrier": "ups",
                    "carrier_service_name": "UPS Worldwide Express",
                    "carrier_service_code": "07",
                    "carrier_logo_url": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/ups.png",
                    "carrier_logo_url_svg": "https://enviaya-public.s3-us-west-1.amazonaws.com/images/ups.svg",
                    "estimated_delivery": "2018-10-02 10:30",
                    "net_shipping_amount": 273.76,
                    "net_surcharges_amount": 45,
                    "net_total_amount": 318.76,
                    "vat_amount": 51,
                    "vat_rate": 16,
                    "total_amount": 369.76,
                    "currency": "MXN",
                    "list_total_amount": 372.98,
                    "list_total_amount_currency": "MXN",
                    "subsidy_total_amount": 0,
                    "service_terms": "",
                    "surcharges_break_down": [
                      {
                        "carrier_surcharge_name": "Insurance",
                        "surcharge_net_amount": 45,
                        "surcharge_vat": 7.2,
                        "surcharge_total": 52.2
                      }
                    ],
                    "enviaya_service_name": "TBD",
                    "enviaya_service_code": "TBD"
                  }
                ],
                "minutos": []
              }
            end
          end
        end
      end
    end
  end
end
