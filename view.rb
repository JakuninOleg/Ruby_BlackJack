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
    puts "Приветствуем, #{player_name} - в игре Ruby BlackJack!"
    line2
    puts
  end

  def show__player_cards(player)
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
    puts "Карты диллера: "
    dealer.cards
    puts
  end

  def line
    puts '============================================'
  end

  def line2
    puts '--------------------------------------------'
  end
end
