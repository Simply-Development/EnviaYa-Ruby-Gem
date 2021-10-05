module Shared
  module Domain
    module ValueObjects
      class LabelFormatValueObject
        def initialize(label_format)
          unless ['Letter', 'ZPL', 'EPL'].include?(label_format)
            raise ArgumentError, "Invalid label_format: #{label_format}"
          end
  
          @value = label_format
        end
      end
    end
  end
end
