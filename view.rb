class View
  def game_info
    print `clear`
    line
    puts 'Приветствуем в игре Ruby BlackJack!'
    puts 'Если ты готов испытать удачу и сорвать'
    puts 'куш, скорее вводи имя и давай начнём!'
    line
    puts
  end

  def ask_player_name
    puts 'Введите имя:'
    print '>'
    gets.chomp.to_s
  end

  def greeting(player_name)
    puts
    puts "Приветствуем, #{player_name}! Игра началась."
    line2
  end

  def show_player_cards(player)
    puts
    puts 'Ваши карты:'
    player.current_cards.each { |card| print "#{card.suit}#{card.name} " }
    puts
  end

  def show_score(user)
    line2
    puts "Ваш счёт: #{user.score}"
    line2
    puts
  end

  def show_dealer_cards(dealer)
    puts 'Карты диллера:'
    dealer.current_cards.each { |card| print "#{card.suit}#{card.name} " }
    puts
  end

  def show_closed_dealer_cards(dealer)
    puts 'Карты диллера:'
    dealer.current_cards.each { print '* ' }
    puts
    line2
    puts
  end

  def show_game_options(controller)
    puts "Выберите действие:"
    controller.game_options_array.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
    print '>'
    controller.game_options_array[gets.chomp.to_i - 1]
  end

  def dealer_winner_message
    puts "Победа диллера!"
  end

  def player_winner_message
    puts "Вы одержали победу!"
  end

  def draw_message
    puts "Ничья. Деньги возвращены."
  end

  def show_dealer_balance(dealer)
    puts "Баланс дилера: #{dealer.money}$"
  end

  def show_player_balance(player)
    puts "Ваш баланс: #{player.money}$"
  end

  private

  def line
    puts '============================================'
  end

  def line2
    puts '--------------------------------------------'
  end
end
