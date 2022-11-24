require './src/music_album/music_album'

describe MusicAlbum do
  context 'test can_be_archived? method' do
    it 'should return true' do
      music_album = MusicAlbum.new('2011-11-20', true)
      result = music_album.can_be_archived?
      expect(result).to eql true
    end
    it 'should return false' do
      music_album = MusicAlbum.new('2018-11-20', true)
      result = music_album.can_be_archived?
      expect(result).to eql false
    end
    it 'should return false' do
      music_album = MusicAlbum.new('2001-11-20', false)
      result = music_album.can_be_archived?
      expect(result).to eql false
    end
  end
end
