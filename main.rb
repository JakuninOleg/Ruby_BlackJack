require_relative 'deck'
require_relative 'card'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'
require_relative 'view'
require_relative 'controller'
require_relative 'router'

controller = Controller.new
router = Router.new(controller)
router.run
