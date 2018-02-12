class Dealer < User
  def cards
    current_cards.each { |card| print '* ' }
  end
end
