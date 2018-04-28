class ControllerEn < Controller
  attr_reader :game_options_array, :player, :dealer, :view

  def initialize
    super
    @view = ViewEn.new
  end

  # game and round methods

  def start_round
    super
    @game_options_array = ['Skip', 'Take card', 'Open up']
  end

  # player methods

  def player_skip_turn!
    @game_options_array.delete('Skip')
    super
  end

  def player_take_card!
    @game_options_array.delete('Take card')
    super
  end

  # boolean methods

  def not_skipped?
    @game_options_array.include? 'Open up'
  end

  # private

  def player_take_card
    @game_options_array.delete('Skip')
    super
  end
end
