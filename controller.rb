class Controller
  def initialize
    @view = View.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def initial_deal
    card = @deck.cards.sample
    @player.current_cards << card
    @deck.cards.delete(card)
  end

  def start_game
    @view.game_info
    @player.name = @view.ask_player_name
    @view.greeting(@player.name)
    create_new_deck
    2.times { initial_deal }
    @view.show__player_cards(@player)
    @view.show_score(@player)
  end

  def create_new_deck
    @deck = Deck.new
  end
end
