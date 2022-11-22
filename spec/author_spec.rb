require_relative '../src/author/author'

describe Author do
  context '#author' do
    before do
      @author1 = Author.new('Aakash', 'Verma')
      @author2 = Author.new('Juan', 'Diaz')
      @author3 = Author.new('Yasin', 'Abdulwahed')
    end

    describe 'Testing Author Class Case #1' do
      it 'will check first_name should be "Aakash" for @author1' do
        expect(@author1.first_name).to eql('Aakash')
      end

      it 'will check last_name should be "Diaz" for @author2' do
        expect(@author2.last_name).to eql('Diaz')
      end

      it 'will check full_name should be "Yasin Abdulwahed" for @author3' do
        full_name = @author3.first_name + ' '+@author3.last_name
        expect(full_name).to eql('Yasin Abdulwahed')
      end
    end
  end
end