class Controller
  BANK = 20
  attr_reader :game_options_array, :player

  def initialize
    @view = View.new
    @player = Player.new
    @dealer = Dealer.new
    @game_options_array = ['Пропуск', 'Взять карту', 'Открыться']
  end

  def start_game
    @view.game_info
    @player.name = @view.ask_player_name
    @view.greeting(@player.name)
    create_new_deck
    initial_deal
    bets
    @view.show_player_cards(@player)
    @view.show_score(@player)
    @view.show_closed_dealer_cards(@dealer)
  end

  def player_turn
    @view.show_game_options(self)
  end

  def player_skip_turn!
    @game_options_array.delete('Пропуск')
  end

  def player_take_card!
    @game_options_array.delete('Взять карту')
    take_card(@player)
  end

  def dealer_turn
    take_card(@dealer) if @dealer.score < 17
  end

  def finish_round
    @view.show_player_cards(@player)
    @view.show_score(@player)
    @view.show_dealer_cards(@dealer)
    @view.show_score(@dealer)
  end

  def game_on?
    normal_score? && not_skipped? && not_full_hand?
  end

  def normal_score?
    @player.score <= 21 && @dealer.score <= 21
  end

  def not_skipped?
    @game_options_array.include? 'Открыться'
  end

  def not_full_hand?
    @player.current_cards.size < 3 && @dealer.current_cards.size < 3
  end

  private

  def take_card(user)
    card = @deck.cards[0]
    user.current_cards << card
    @deck.cards.delete(card)
  end

  def create_new_deck
    @deck = Deck.new
    @deck.shuffle!
  end

  def initial_deal
    2.times { take_card(@player) }
    2.times { take_card(@dealer) }
  end

  def bets
    @player.bet!
    @dealer.bet!
  end

  def player_take_card
    take_card(@player)
    @game_options_array.delete('Пропуск')
    @view.show__player_cards(@player)
    @view.show_score(@player)
  end
end
