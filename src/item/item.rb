require 'securerandom'
require_relative '../utils/time_diff'

class Item
  attr_reader :genre, :author, :source, :label

  def initialize(publish_date)
    @id = SecureRandom.hex(5)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    TimeDiff.years(@publish_date) >= 10
  end

  def move_to_archive()
    @archived = can_be_archived? if can_be_archived?
  end

  def genre=(genre)
  end

  def author=(author)
  end

  def source=(source)
  end

  def label=(label)
  end
end
