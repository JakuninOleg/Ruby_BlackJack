class Deck
  SUITS = %w[♠ ♥ ♦ ♣].freeze
  NAMES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  private

  def create_deck
    SUITS.each do |suit|
      NAMES.each_with_index do |name, index|
        @cards << Card.new(name, suit, VALUES[index])
      end
    end
  end
end
