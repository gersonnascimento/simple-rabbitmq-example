require './services/rabbitmq_queue_reader'

class InstallServiceQueueReader < RabbitmqQueueReader
  def handle_message(_delivery_info, _properties, body)
    puts "Instalando serviço: #{_properties.headers['service_name']}"
    sleep(5)
    puts "Serviço #{_properties.headers['service_name']} instalado com sucesso!"
  end
end
