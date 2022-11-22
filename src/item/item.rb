require_relative '../../utils/time_diff'
require 'securerandom'

class Item
  attr_reader :genre, :author, :source, :label

  def initialize(publish_date)
    @id = SecureRandom.hex(5)
    @publish_date = Date.strptime(publish_date, '%m/%d/%Y')
    @archived = false
  end

  def can_be_archived?
    TimeDiff.new.years(@publish_date) >= 10
  end

  def move_to_archive()
    @archived = can_be_archived? if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
end
