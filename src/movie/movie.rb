require_relative '../item/item'
require 'date'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date, silent)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
