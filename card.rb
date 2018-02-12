class Card
  attr_reader :name, :suit, :value
  attr_writer :value

  def initialize(name, suit, value)
    @name = name
    @suit = suit
    @value = value
  end

  # def ace_value(user)
  #   return unless user.current_cards.include? 'Ace'
  #   user.current_cards.map do |card|
  #     if user.score + 11 > 21
  #       card.value = 1 if card.name == 'Ace'
  #     else
  #       card.value = 11 if card.name == 'Ace'
  #     end
  #   end
  # end
end
