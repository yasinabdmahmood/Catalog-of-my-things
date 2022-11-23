require_relative '../src/game/game'

describe Game do
  context '#game' do
    before do
      @game1 = Game.new('y', '12/08/2018', '10/10/2021')
      @game2 = Game.new('n', '12/08/2010', '10/10/2018')
    end

    describe 'Testing Game Class Case #1' do
      it 'will check @game_1 is an instance of Game class' do
        expect(@game1).to be_an_instance_of Game
      end

      it 'will check @game_1 is multiplayer enabled should return "y"' do
        expect(@game1.multiplayer).to eql('y')
      end

      it 'will check @game_1 method can_be_archived? should false' do
        expect(@game1.can_be_archived?).to eql false
      end
    end

    describe 'Testing Game Class Case #2' do
      it 'will check @game_2 is an instance of Game class' do
        expect(@game2).to be_an_instance_of Game
      end

      it 'will check @game_2 is multiplayer enabled should return "y"' do
        expect(@game2.multiplayer).to eql('n')
      end

      it 'will check @game_2 method can_be_archived? should false' do
        expect(@game2.can_be_archived?).to eql true
      end
    end
  end
end
