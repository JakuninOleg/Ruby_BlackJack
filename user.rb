class User
  attr_reader :current_cards, :score
  attr_accessor :money, :current_cards

  def initialize
    @money = 100
    @current_cards = []
    @score = 0
  end

  def bet!
    @money -= 10
  end

  def count_score
    no_aces
    three_aces
    two_aces_two_cards
    two_aces_three_cards
    one_ace_two_cards
    one_ace_three_cards
  end

  private

  def cards_value
    @current_cards.map(&:value).reduce(0, :+)
  end

  def count_aces
    current_cards.count { |card| card.name == 'Ace' }
  end

  def no_aces
    @score = cards_value if count_aces == 0
  end

  def three_aces
    @score = 13 if count_aces == 3
  end

  def two_aces_two_cards
    return unless count_aces == 2
    return unless current_cards.size == 2
    @score = 12
  end

  def two_aces_three_cards
    return unless count_aces == 2
    return unless current_cards.size == 3
    @score = cards_value + 12
    @score = 12 if current_cards.any? { |card| card.value == 10 }
  end

  def one_ace_two_cards
    return unless count_aces == 1
    return unless current_cards.size == 2
    @score = cards_value + 11
  end

  def one_ace_three_cards
    return unless count_aces == 1
    return unless current_cards.size == 3
    @score = cards_value + 1
    @score = cards_value + 11 if cards_value <= 10
  end
end

