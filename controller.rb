class Controller
  def initialize
    @view = View.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start_game
    @view.game_info
    @player.name = @view.ask_player_name
    @view.greeting(@player.name)
    create_new_deck
    initial_deal
    @player.bet!
    @dealer.bet!
    @view.show__player_cards(@player)
    @view.show_score(@player)
    @view.show_dealer_cards(@dealer)
  end

  def take_card(user)
    card = @deck.cards.sample
    user.current_cards << card
    @deck.cards.delete(card)
  end

  def initial_deal
    2.times { take_card(@player) }
    2.times { take_card(@dealer) }
  end

  def create_new_deck
    @deck = Deck.new
    @deck.shuffle!
  end
end
