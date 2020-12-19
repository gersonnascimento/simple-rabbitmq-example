# Simple RabbitMq Example

It's a simple system for learning how to use the RabbitMq.
It's a service installer simulator, when requesting a installation, a message is sent to RabbitMq and another class read it.

## How to use

- You need to have a RabbitMq running, you can do this using docker:

`docker run -d --name rabbitmq  -p 5672:5672  -p 15672:15672  --restart=always  --hostname rabbitmq-master  rabbitmq`
