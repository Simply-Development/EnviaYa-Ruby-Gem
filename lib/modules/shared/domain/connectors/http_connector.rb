module Shared
  module Domain
    module Connectors
      class HttpConnector
        def execute(uri, method:, body:)
          raise NotImplementedError, "method not implemented yet"
        end
      end
    end
  end
end
