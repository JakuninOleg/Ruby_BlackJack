class Card
  attr_reader :name, :suit

  def initialize(name, suit, value)
    @name = name
    @suit = suit
    @value = value
  end
end
