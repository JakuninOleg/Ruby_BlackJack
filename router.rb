class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    @controller.start_game
    until @controller.empty_pockets?
      @controller.start_round
      sleep 2
      choice = @controller.player_turn
      run_round(choice)
      @controller.finish_round
      sleep 3
      break if @controller.empty_pockets?
      game_choice = @controller.view.show_game_options
      @controller.player_leave if game_choice == 2
      break if game_choice == 2
      print `clear`
    end
    @controller.player_won_game
    @controller.player_lost_game
  end

  private

  def run_round(choice)
    while @controller.game_on?
      case choice
      when 'Пропуск'
        @controller.player_skip_turn!
        sleep 1
        @controller.dealer_turn
        sleep 1
        break if @controller.dealer_score_exceed?
        @controller.show_player_cards
        choice = @controller.player_turn
      when 'Взять карту'
        @controller.player_take_card!
        sleep 1
        break if @controller.player_score_exceed?
        @controller.dealer_turn
      when 'Открыться'
        print `clear`
        @controller.view.player_opened
        sleep 1
        break
      end
    end
  end
end
