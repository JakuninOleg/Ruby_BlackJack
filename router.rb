class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    @controller.start_game
    while @controller.player.money > 0 && @controller.dealer.money > 0
      @controller.start_round
      choice = @controller.player_turn
      run_round(choice)
      @controller.finish_round
    end
  end

  def run_round(choice)
    while @controller.game_on?
      case choice
      when 'Пропуск'
        @controller.player_skip_turn!
        @controller.dealer_turn
        break if @controller.dealer_score_exceed?
        choice = @controller.player_turn
      when 'Взять карту'
        @controller.player_take_card!
        break if @controller.player_score_exceed?
        @controller.dealer_turn
      when 'Открыться'
        break
      end
    end
  end
end
