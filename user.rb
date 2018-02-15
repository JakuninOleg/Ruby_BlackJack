class User
  attr_reader :current_cards, :score
  attr_accessor :money

  def initialize
    @money = 100
    @current_cards = []
    @score = 0
  end

  def bet!
    @money -= 10
  end

  def count_score
    no_aces_score
    aces_score
  end

  private

  def no_aces_score
    @score = @current_cards.map(&:value).reduce(0, :+)
  end

  def score_array
    aces, non_aces = current_cards.partition(&:ace?)
    base_value = non_aces.sum(&:value) + aces.size
    score_array = Array.new(aces.size + 1) { |high_aces| base_value + 10 * high_aces }
    score_array.select { |x| x <= 21 }.max
  end

  def aces_score
    @score = score_array if aces?
  end

  def aces?
    current_cards.any?(&:ace?)
  end
end
