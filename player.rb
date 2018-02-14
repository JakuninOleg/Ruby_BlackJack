class Player < User
  attr_accessor :name

  def last_card
    current_cards.last.suit + current_cards.last.name
  end
end
