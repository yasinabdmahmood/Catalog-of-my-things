require './src/music_album/music_album'

describe MusicAlbum do
  context 'test can_be_archived? method' do
    it 'should return true' do
      music_album = MusicAlbum.new('20/11/2001', true)
      result = music_album.can_be_archived?
      expect(result).to eql true
    end
    it 'should return false' do
      music_album = MusicAlbum.new('20/11/2018', true)
      result = music_album.can_be_archived?
      expect(result).to eql false
    end
    it 'should return false' do
      music_album = MusicAlbum.new('20/11/2001', false)
      result = music_album.can_be_archived?
      expect(result).to eql false
    end
  end
end
