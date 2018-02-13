class Router
  def initialize(controller)
    @controller = controller
    # @running = true
  end

  def run
    @controller.start_game
    choice = @controller.player_turn
    while @controller.game_on?
      case choice
      when 'Пропуск'
        @controller.player_skip_turn!
        @controller.dealer_turn
        choice = @controller.player_turn
      when 'Взять карту'
        @controller.player_take_card!
        @controller.dealer_turn
      when 'Открыться'
        break
      end
    end
    @controller.finish_round
  end

  private

  # def stop!
  #   @running = false
  # end
end
