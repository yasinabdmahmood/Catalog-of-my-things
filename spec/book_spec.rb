require_relative '../src/book/book'

describe Book do
  context 'Book class tests' do
    before(:each) do
      @book = Book.new('Publisher_Name', '2022-01-01', 'good')
    end

    it 'should be a Book class instance' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should return correct book publisher' do
      expect(@book.publisher).to eq 'Publisher_Name'
    end

    it 'should return correct book cover state' do
      expect(@book.cover_state).to eq 'good'
    end

    it 'should return false unless @archived || cover_state == bad' do
      expect(@book.can_be_archived?).to eq false
    end
  end
end
