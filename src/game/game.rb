require_relative '../item/item'
require_relative '../../utils/time_diff'
require 'date'

class Game < Item
  attr_reader :multiplayer, :publish_date, :last_played_at

  def initialize(multiplayer, publish_date, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
  end

  def can_be_archived?
    super && (TimeDiff.new.years(@last_played_at) > 2)
  end
end
