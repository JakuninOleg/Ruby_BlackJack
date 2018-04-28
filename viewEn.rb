class ViewEn
  # game and round methods

  def game_info
    print `clear`
    line
    puts 'Welcome to the game Ruby BlackJack!'
    puts 'If you are ready to hit a jackpot'
    puts "print your name and let''start!"
    line
    puts
  end

  def ask_player_name
    puts 'Your name:'
    print '>'
    gets.chomp.to_s
  end

  def greeting(player_name)
    puts
    puts "Welcome, #{player_name}! Game has started!"
    line2
  end

  def show_game_options
    line2
    puts 'Continue game?'
    puts '1 - Yes'
    puts '2 - No'
    print '>'
    gets.chomp.to_i
  end

  def new_deal(player)
    line2
    puts "Your bet - #{player.bet}$. Your current balance: #{player.money}$"
    line2
    sleep 1
    puts 'Dealing cards...'
    puts
  end

  def show_round_options(controller)
    puts 'Choose your action:'
    controller.game_options_array.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
    print '>'
    controller.game_options_array[gets.chomp.to_i - 1]
  end

  def draw_message
    puts 'Draw. Money has been returned.'
  end

  def dealer_win_game
    line
    puts 'Dealer is overwhelming!'
    puts 'You have no money in your pockets!'
    puts 'Come back when you got some more!'
    line
  end

  def player_win_game(player)
    line
    puts 'Wow, you have won the casino!'
    puts "Your prize is: #{player.money}$!"
    puts "You sure you didn't cheat? Congratulations!"
    puts 'Come back to our casino in the future!'
    line
  end

  # player methods

  def show_player_cards(player)
    puts
    puts 'Your cards:'
    player.current_cards.each { |card| print "#{card.suit}#{card.name} " }
    puts
  end

  def show_player_score(player)
    line2
    puts "Your score: #{player.score}"
    line2
    puts
  end

  def ask_bet_amount
    puts 'How much are you willing to bet:'
    print '>'
    gets.chomp.to_i
  end

  def player_skipped_turn
    puts 'You skipped the turn'
  end

  def player_opened
    puts 'You decided to open up'
  end

  def player_took_card(player)
    puts "You got #{player.last_card} card"
  end

  def too_much_value_player
    puts 'You have too many points!'
  end

  def player_winner_message
    puts 'You are victorious!'
  end

  def player_leave(player)
    line2
    puts "Thank you for the game! Your score: #{player.money}$"
    line2
  end

  def show_player_balance(player)
    puts "Your balance: #{player.money}$"
  end

  # dealer methods

  def show_closed_dealer_cards(dealer)
    puts 'Dealer cards:'
    dealer.current_cards.each { print '* ' }
    puts
    line2
    puts
  end

  def show_dealer_cards(dealer)
    puts 'Dealer cards:'
    dealer.current_cards.each { |card| print "#{card.suit}#{card.name} " }
    puts
  end

  def show_dealer_score(dealer)
    line2
    puts "Dealer score: #{dealer.score}"
    line2
    puts
  end

  def dealer_took_card
    puts
    puts 'Dealer took a card'
    puts
  end

  def dealer_skipped
    puts
    puts 'Dealer decided not to take a card'
    puts
  end

  def too_much_value_dealer
    puts 'Dealer has too many points!'
  end

  def dealer_winner_message(player)
    puts 'Deals has won!'
    puts "You lost #{player.bet}$!"
  end

  def show_dealer_balance(dealer)
    puts "Dealer balance: #{dealer.money}$"
  end

  private

  def line
    puts '============================================'
  end

  def line2
    puts '--------------------------------------------'
  end
end
