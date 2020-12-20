require './use_cases/install_service'

while true do
  puts 'Digite o nome do serviço que deseja instalar:'
  service_name = gets.chomp

  UseCases::InstallService.new(service_name).call
end
