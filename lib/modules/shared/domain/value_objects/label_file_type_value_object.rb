module EnviaYa
  module Shared
    module Domain
      module ValueObjects
        class LabelFileTypeValueObject
          def initialize(label_file_type)
            unless ['PDF', 'JPG', 'GIF'].include?(label_file_type)
              raise ArgumentError, "Invalid label_file_type: #{label_file_type}"
            end
    
            @value = label_file_type
          end
  
          def value
            @value
          end
        end
      end
    end
  end
end
