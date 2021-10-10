require 'singleton'
require_relative './modules/rates/infrastructure/repositories/create_rate_repository/create_rate_http_repository.rb'
require_relative './modules/rates/application/commands/create_rate_command.rb'

module EnviaYa
  include Rates::Infrastructure::Repositories
  include Rates::Application::Commands

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
