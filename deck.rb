class Deck
  SUITS = ['♠', '♥', '♦', '♣']
  NAMES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 0]

  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def create_deck
    SUITS.each do |suit|
      NAMES.each_with_index { |name, index| @cards << Card.new(name, suit, VALUES[index]) }
    end
  end

  def shuffle!
    @deck.shuffle!
  end
end


