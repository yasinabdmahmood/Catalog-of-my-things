require_relative '../src/source/source'
require_relative '../src/item/item'

describe Source do
  context 'Test add_item method' do
    source = Source.new('source')
    item = Item.new('11/11/2011')
    it 'items instance variable should should have langth of one' do
      source.add_item(item)
      expect(source.items.length).to eql 1
    end
  end
end
