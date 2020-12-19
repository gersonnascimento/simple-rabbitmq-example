require 'bunny'
require './services/rabbitmq_message_publisher'
require './entities/service.rb'

module UseCases
  class InstallService
    INSTALL_SERVICE_MESSAGE = 'install_service'
    INSTALL_SERVICE_QUEUE = 'service_installations'

    def initialize(service_name)
      @service_name = service_name
    end

    def call
      create_service_object
      send_installation_message
    end

    private

    def create_service_object
      Service.new(@service_name)
    end

    def send_installation_message
      RabbitmqMessagePublisher.new.call(
        INSTALL_SERVICE_MESSAGE,
        INSTALL_SERVICE_QUEUE,
        message_headers,
      )
    end

    def message_headers
      { service_name: @service_name }
    end
  end
end
