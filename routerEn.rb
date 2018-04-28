class RouterEn < Router
  private

  def run_round(choice)
    while @controller.game_on?
      case choice
      when 'Skip'
        @controller.player_skip_turn!
        sleep 1
        @controller.dealer_turn
        sleep 1
        break if @controller.dealer_score_exceed?
        @controller.show_player_cards
        choice = @controller.player_turn
      when 'Take card'
        @controller.player_take_card!
        sleep 1
        break if @controller.player_score_exceed?
        @controller.dealer_turn
      when 'Open up'
        print `clear`
        @controller.view.player_opened
        sleep 1
        break
      end
    end
  end
end
