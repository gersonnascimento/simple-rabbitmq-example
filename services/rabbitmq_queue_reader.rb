require 'bunny'

class RabbitmqQueueReader
  def initialize(queue)
    @queue = queue
  end

  def call
    start_connection.tap do | connection |
      channel = connection.create_channel
      queue = channel.queue(@queue)

      begin
        puts "Listening to queue #{queue}. Press CTRL+C to exit"
        queue.subscribe(block: true) do |_delivery_info, _properties, body|
          handle_message(_delivery_info, _properties, body)
        end
      rescue Interrupt => _
        connection.close

        exit(0)
      end
    end
  end

  def handle_message(_delivery_info, _properties, body)
    raise 'Must implement error'
  end

  private

  def start_connection
    Bunny.new(host: 'rabbitmq').start
  end
end
