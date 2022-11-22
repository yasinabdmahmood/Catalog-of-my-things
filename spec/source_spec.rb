require './src/source/source'
# mock Item class
class Item
  attr_reader :source

  def source=(source); end
end
describe Source do
  context 'Test add_item method' do
    source = Source.new('source')
    item = Item.new
    it 'items instance variable should should have langth of one' do
      source.add_item(item)
      expect(source.items.length).to eql 1
    end
  end
end
