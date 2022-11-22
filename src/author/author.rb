require 'securerandom'

class Author
  def initialize(first_name, last_name)
    @id = SecureRandom.hex(5)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
