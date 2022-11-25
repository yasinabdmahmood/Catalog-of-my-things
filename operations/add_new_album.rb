require_relative '../src/music_album/music_album'
require_relative '../src/genre/genre'
require_relative '../src/label/label'
require_relative '../utils/helper'
require_relative '../utils/msg'

def add_new_album
  title,
  genre_name,
  pub_date,
  on_spotify = Helper.ask_for_user_inputs(
    'Enter music\'s name : ',
    'Enter genre\'s name : ',
    'Enter music launch date : ',
    'Is it available on spotify ? (y/n) : '
  )
  on_spotify = on_spotify.downcase == 'y'
  music_album = MusicAlbum.new(pub_date, on_spotify)
  label = Label.new(title, 'MUSIC')
  genre = Genre.new(genre_name)
  label.add_item(music_album)
  genre.add_item(music_album)
  [music_album, label, genre]
end
