require_relative '../item/item';
require_relative '../../utils/time_diff'
require 'date'

class Game < Item
  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%m/%d/%Y')
  end

  def can_be_archived?
    super && (TimeDiff.years(@last_played_at) > 2)
  end
end