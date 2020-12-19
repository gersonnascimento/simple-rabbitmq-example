require 'bunny'

class RabbitmqMessagePublisher
  def call(message, queue_name, headers = {})
    start_connection.tap do | connection |
      channel = connection.create_channel
      queue = channel.queue(queue_name)

      channel.default_exchange.publish(
        message,
        headers: headers,
        routing_key: queue.name
      )

      puts "Sent to RabbitMq: #{message}"
      connection.close
    end
  end

  private

  def start_connection
    Bunny.new.start
  end
end
