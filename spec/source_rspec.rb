require './src/source/source.rb'
#mock Item class
class Item 
    def set_source(source)
        @source = source
    end
end
describe Source do
  context 'Test factorial method' do
    source = Source.new('source')
    item = Item.new
    it 'items instance variable should should have langth of one' do
      source.add_item(item)
      expect(source.items.length).to eql 1
    end
  end
end