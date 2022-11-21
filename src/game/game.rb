require_relative '../item/item';
require 'date'

class Game < Item
  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%m/%d/%Y')
  end

  def time_diff
    total_days = (Date.today - @last_played_at).to_i
    (total_days/365).to_i
  end

  def can_be_archived?
    super && (time_diff > 2)
  end
end