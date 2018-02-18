class User
  attr_reader :current_cards, :score
  attr_accessor :money, :bet

  def initialize
    @money = 100
    @current_cards = []
    @score = 0
  end

  def bet!
    @money -= bet
  end

  def count_score
    @score = score_array
  end

  private

  def score_array
    aces, non_aces = current_cards.partition(&:ace?)
    base_value = non_aces.sum(&:value) + aces.size
    return base_value unless aces?
    score_array = Array.new(aces.size + 1) { |high_aces| base_value + 10 * high_aces }
    score_array.select { |score| score <= 21 }.max
  end

  def aces?
    current_cards.any?(&:ace?)
  end
end
