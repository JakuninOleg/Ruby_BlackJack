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
    create_new_deck
    2.times { initial_deal }
  end

  def create_new_deck
    @deck = Deck.new
  end
end
