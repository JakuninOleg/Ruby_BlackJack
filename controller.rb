class Controller
  attr_reader :game_options_array, :player, :dealer, :view

  # game and round methods

  def initialize
    @view = View.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start_game
    @view.game_info
    @player.name = @view.ask_player_name
    @view.greeting(@player.name)
    @view.show_player_balance(@player)
  end

  def start_round
    @game_options_array = ['Пропуск', 'Взять карту', 'Открыться']
    @player.current_cards.clear
    @dealer.current_cards.clear
    create_new_deck
    bets
    @view.new_deal(@player)
    sleep 2
    initial_deal
    @view.show_player_cards(@player)
    count_users_score
    @view.show_player_score(@player)
    @view.show_closed_dealer_cards(@dealer)
  end

  def finish_round
    @view.show_player_cards(@player)
    @view.show_player_score(@player)
    sleep 2
    @view.show_dealer_cards(@dealer)
    @view.show_dealer_score(@dealer)
    sleep 2
    instant_lose_player
    instant_lose_dealer
    round_winner
    @view.show_player_balance(@player)
  end

  def round_winner
    return if score_exceed?
    if @dealer.score > @player.score
      dealer_win
    elsif @player.score > @dealer.score
      player_win
    else
      draw
    end
  end

  def draw
    @dealer.money += 10
    @player.money += 10
    @view.draw_message
  end

  def instant_lose_player
    return unless @player.score > 21
    @view.too_much_value_player
    dealer_win
  end

  def instant_lose_dealer
    return unless @dealer.score > 21
    @view.too_much_value_dealer
    player_win
  end

  def player_leave
    @view.player_leave(@player)
  end

  def player_lost_game
    @view.dealer_win_game if @player.money.zero?
  end

  def player_won_game
    @view.player_win_game(@player) if @dealer.money.zero?
  end

  # player methods

  def player_turn
    @view.show_round_options(self)
  end

  def player_skip_turn!
    print `clear`
    @game_options_array.delete('Пропуск')
    @view.player_skipped_turn
  end

  def player_take_card!
    print `clear`
    @game_options_array.delete('Взять карту')
    take_card(@player)
    @view.player_took_card(@player)
    @player.count_score
  end

  def player_win
    @view.player_winner_message
    @player.money += 20
  end

  def show_player_cards
    return if dealer_score_exceed?
    @view.show_player_cards(@player)
    @view.show_player_score(@player)
  end

  # dealer methods

  def dealer_turn
    take_card(@dealer) if @dealer.score < 17
    @dealer.count_score
    @view.dealer_took_card if @dealer.current_cards.size == 3
    @view.dealer_skipped if @dealer.current_cards.size == 2
  end

  def dealer_win
    @view.dealer_winner_message
    @dealer.money += 20
  end

  # boolean methods

  def player_score_exceed?
    @player.score > 21
  end

  def dealer_score_exceed?
    @dealer.score > 21
  end

  def score_exceed?
    player_score_exceed? || dealer_score_exceed?
  end

  def empty_pockets?
    player.money.zero? || dealer.money.zero?
  end

  def normal_score?
    @player.score <= 21 && @dealer.score <= 21
  end

  def not_skipped?
    @game_options_array.include? 'Открыться'
  end

  def not_full_hand?
    @player.current_cards.size < 3 && @dealer.current_cards.size <= 3
  end

  def game_on?
    normal_score? && not_skipped? && not_full_hand?
  end

  private

  def count_users_score
    @player.count_score
    @dealer.count_score
  end

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
    @view.show_player_cards(@player)
    @view.show_score(@player)
  end
end
