class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  # METHODS = { 1 =>

  # }

  def run
    @controller.start_game
    # while @running
    # end
  end

  def stop!
    @running = false
  end

  def display_actions
    puts '1 - Пропуск хода'
    puts '2 - Взять карту'
    puts '3 - Открыть карты'
  end
end
