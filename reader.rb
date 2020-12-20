require './services/install_service_queue_reader'

InstallServiceQueueReader.new(
  'service_installations'
).call
