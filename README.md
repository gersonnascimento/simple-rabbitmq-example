# Simple RabbitMq Example

It's a simple system for learning how to use the RabbitMq.
It's a service installer simulator, when requesting a installation, a message is sent to RabbitMq and another class read it.

## How to use (we recommend using Docker)

- Run `docker-compose up` and wait starting RabbitMq
- Run `docker attach simple-rabbitmq-example_main_1` and you can type the service names for installing
- Run `docker exec -it simple-rabbitmq-example_main_1 script/reader.sh` for starting queue reader, it'll install the services which are on the queues.
