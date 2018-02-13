class User
  attr_reader :bank, :current_cards
  attr_writer :current_cards

  def initialize
    @money = 100
    @current_cards = []
  end

  def bet!
    @money -= 10
  end

  def score
    ace_value
    cards_value
  end

  # private

  def cards_value
    @current_cards.map(&:value).reduce(0, :+)
  end

  def ace_value
    return unless current_cards.any? { |card| card.name == 'Ace' }
    return unless cards_value > 21

    current_cards.map do |card|
      card.value = 1 if card.name == 'Ace'
    end
  end
end
