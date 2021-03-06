module EnviaYa
  module Shared
    module Domain
      module ValueObjects
        class HttpMethodValueObject
          def initialize(http_method)
            unless ['GET', 'POST', 'PATCH', 'PUT'].include?(http_method)
              raise ArgumentError, "Invalid http_method: #{http_method}"
            end
    
            @value = http_method
          end
  
          def value
            @value
          end
        end
      end
    end
  end
end
