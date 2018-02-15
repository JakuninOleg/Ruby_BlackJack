class Card
  attr_accessor :value
  attr_reader :name, :suit

  def initialize(name, suit, value)
    @name = name
    @suit = suit
    @value = value
  end

  def ace?
    name == 'Ace'
  end
end
