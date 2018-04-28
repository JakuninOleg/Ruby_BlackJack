require_relative 'deck'
require_relative 'card'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'
require_relative 'view'
require_relative 'viewEn'
require_relative 'controller'
require_relative 'controllerEn'
require_relative 'router'
require_relative 'routerEn'

puts 'Choose Language 1. Ru; 2. En'
choice = gets.chomp.to_i

if choice == 1
  router = Router.new(Controller.new)
else
  router = RouterEn.new(ControllerEn.new)
end

router.run
