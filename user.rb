class User
  attr_reader :bank, :current_cards

  def initialize
    @bank = 100
    @current_cards = []
  end
end
