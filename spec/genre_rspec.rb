require './src/genre/genre.rb'
#mock Item class
class Item 
    def set_source(source)
        @source = source
    end
end
describe Genre do
  context 'test add_item method' do
    genre = Genre.new('genre')
    item = Item.new
    it 'items instance variable should should have langth of one' do
      genre.add_item(item)
      expect(genre.items.length).to eql 1
    end
  end
end