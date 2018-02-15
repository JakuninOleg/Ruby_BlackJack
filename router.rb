class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    @controller.start_game
    until @controller.empty_pockets?
      @controller.start_round
      choice = @controller.player_turn
      run_round(choice)
      @controller.finish_round
      sleep 3
      game_choice = @controller.view.show_game_options
      break if game_choice == 2
    end
  end

  def run_round(choice)
    while @controller.game_on?
      case choice
      when 'Пропуск'
        @controller.player_skip_turn!
        sleep 1
        @controller.dealer_turn
        sleep 1
        break if @controller.dealer_score_exceed?
        choice = @controller.player_turn
      when 'Взять карту'
        @controller.player_take_card!
        sleep 1
        break if @controller.player_score_exceed?
        @controller.dealer_turn
      when 'Открыться'
        @controller.view.player_opened
        break
      end
    end
  end
end
