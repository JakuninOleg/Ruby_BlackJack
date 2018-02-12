class User
  attr_reader :bank, :current_cards
  attr_writer :current_cards

  def initialize
    @bank = 100
    @current_cards = []
    # @score = 0
  end

  def cards_value
    @current_cards.map(&:value).reduce(0, :+)
  end

  def ace_value
    return unless current_cards.any? { |card| card.name == 'Ace' }
    if cards_value + 11 <= 22
      current_cards.map do |card|
        card.value = 11 if card.name == 'Ace'
      end
    end
  end

  def score
    ace_value
    cards_value
  end
end

