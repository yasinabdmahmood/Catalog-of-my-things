class Source
  attr_reader :items, :name, :id

  def initialize(name)
    @id = rand(0...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.source = self
  end
end
