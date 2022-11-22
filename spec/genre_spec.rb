require_relative '../src/genre/genre'
require_relative '../src/item/item'

describe Genre do
  context 'test add_item method' do
    genre = Genre.new('genre')
    item = Item.new('11/20/2018')
    it 'items instance variable should should have langth of one' do
      genre.add_item(item)
      expect(genre.items.length).to eql 1
    end
  end
end
