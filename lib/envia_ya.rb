require 'singleton'
require_relative './modules/rates/rates'
require_relative './modules/shared/shared'

module EnviaYa
  class Config
    include Singleton

    attr_accessor :api_key

    def self.api_key=(api_key)
      instance.api_key = api_key
    end

    def self.api_key
      instance.api_key
    end
  end
end
