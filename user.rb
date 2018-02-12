class User
  attr_reader :bank, :current_cards

  def initialize
    @bank = 100
    @current_cards = []
  end

  def cards_value
    @current_cards.map(&:value).reduce(0, :+)
  end

  def bet!
    @bank -= 10
  end

  def ace_value
    return unless current_cards.any? { |card| card.name == 'Ace' }
    return unless cards_value + 11 <= 22

    current_cards.map do |card|
      card.value = 11 if card.name == 'Ace'
    end
  end

  def score
    ace_value
    cards_value
  end
end
