class View
  # game and round methods

  def game_info
    print `clear`
    line
    puts 'Приветствуем в игре Ruby BlackJack!'
    puts 'Если Вы готовы испытать удачу и сорвать'
    puts 'куш, скорее вводите имя и давай начнём!'
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

  def show_game_options
    line2
    puts 'Хотите продолжить игру?'
    puts '1 - Да'
    puts '2 - Нет'
    print '>'
    gets.chomp.to_i
  end

  def new_deal(player)
    line2
    puts "Ваша ставка - #{player.bet}$. Ваш текущий баланс: #{player.money}$"
    line2
    sleep 1
    puts 'Идет раздача карт'
    puts
  end

  def show_round_options(controller)
    puts 'Выберите действие:'
    controller.game_options_array.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
    print '>'
    controller.game_options_array[gets.chomp.to_i - 1]
  end

  def draw_message
    puts 'Ничья. Деньги возвращены.'
  end

  def dealer_win_game
    line
    puts 'Дилер одержал сокрушительную победу!'
    puts 'Вы уходите с пустыми карманами!'
    puts 'Приходите снова, когда их заполните!'
    line
  end

  def player_win_game(player)
    line
    puts 'Ну надо же, Вы одержали победу над'
    puts "казино! Ваш выйгрыш составил #{player.money}$!"
    puts 'Вы точно не жульничали? Поздравляем с '
    puts 'победой! Приходите в наше казино ещё!'
    line
  end

  # player methods

  def show_player_cards(player)
    puts
    puts 'Ваши карты:'
    player.current_cards.each { |card| print "#{card.suit}#{card.name} " }
    puts
  end

  def show_player_score(player)
    line2
    puts "Ваш счёт: #{player.score}"
    line2
    puts
  end

  def ask_bet_amount
    puts 'Сколько вы хотите поставить:'
    print '>'
    gets.chomp.to_i
  end

  def player_skipped_turn
    puts 'Вы пропускаете ход'
  end

  def player_opened
    puts 'Вы решили открыться'
  end

  def player_took_card(player)
    puts "Вы вытянули карту #{player.last_card}"
  end

  def too_much_value_player
    puts 'Вы набрали слишком много очков!'
  end

  def player_winner_message
    puts 'Вы одержали победу!'
  end

  def player_leave(player)
    line2
    puts "Спасибо за игру! Ваш счёт: #{player.money}$"
    line2
  end

  def show_player_balance(player)
    puts "Ваш баланс: #{player.money}$"
  end

  # dealer methods

  def show_closed_dealer_cards(dealer)
    puts 'Карты диллера:'
    dealer.current_cards.each { print '* ' }
    puts
    line2
    puts
  end

  def show_dealer_cards(dealer)
    puts 'Карты диллера:'
    dealer.current_cards.each { |card| print "#{card.suit}#{card.name} " }
    puts
  end

  def show_dealer_score(dealer)
    line2
    puts "Счёт дилера: #{dealer.score}"
    line2
    puts
  end

  def dealer_took_card
    puts
    puts 'Дилер успешно взял карту'
    puts
  end

  def dealer_skipped
    puts
    puts 'Дилер не стал брать карту'
    puts
  end

  def too_much_value_dealer
    puts 'Дилер набрал слишком много очков!'
  end

  def dealer_winner_message(player)
    puts 'Победа диллера!'
    puts "Вы проиграли #{player.bet}!"
  end

  def show_dealer_balance(dealer)
    puts "Баланс дилера: #{dealer.money}$"
  end

  private

  def line
    puts '============================================'
  end

  def line2
    puts '--------------------------------------------'
  end
end
