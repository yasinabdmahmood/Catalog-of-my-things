require_relative '../src/book/book'
require_relative '../src/label/label'
require_relative '../src/author/author'
require_relative '../src/game/game'
require_relative '../src/music_album/music_album'
require_relative '../src/genre/genre'
module Reconstruction
  def reconstruct_books(books)
    book_objects = []
    label_objects = []
    author_objects = []
    books.each do |book|
      current_label.add_item(Book.new(book['publisher'], book['publish_date'], book['cover_state']))
      current_author.add_item(Book.new(book['publisher'], book['publish_date'], book['cover_state']))
      book_objects << Book.new(book['publisher'], book['publish_date'], book['cover_state'])
      label_objects << Label.new(book['title'], book['color'])
      author_objects << Author.new(book['first_name'], book['last_name'])
    end
    {
      'books' => book_objects,
      'labels' => label_objects,
      'authors' => author_objects
    }
  end

  def reconstruct_games(games)
    game_objects = []
    label_objects = []
    games.each do |game|
      current_label.add_item(Game.new(game['multiplayer'], game['publish_date'], game['last_played_at']))
      game_objects << Game.new(game['multiplayer'], game['publish_date'], game['last_played_at'])
      label_objects << Label.new(game['title'], game['color'])
    end
    {
      'games' => game_objects,
      'labels' => label_objects
    }
  end

  def reconstruct_music_album(music_albums)
    music_album_objects = []
    genre_objects = []
    label_objects = []
    music_albums.each do |music_album|
      current_genre.add_item(MusicAlbum.new(music_album['publish_date'], music_album['on_spotify']))
      current_label.add_item(MusicAlbum.new(music_album['publish_date'], music_album['on_spotify']))
      music_album_objects << MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'])
      label_objects << Label.new(music_album['title'], music_album['color'])
      genre_objects << Genre.new(music_album['name'])
    end
    {
      'music_albums' => music_album_objects,
      'labels' => label_objects,
      'genres' => genre_objects
    }
  end
end
