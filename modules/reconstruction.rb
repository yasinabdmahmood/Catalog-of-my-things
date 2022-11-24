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
      publisher = book['publisher']
      publish_date = book['publish_date']
      cover_state = book['cover_state']
      title = book['title']
      color = book['color']
      first_name = book['first_name']
      last_name = book['last_name']
      current_book = Book.new(publisher, publish_date, cover_state)
      current_label = Label.new(title, color)
      current_author = Author.new(first_name, last_name)
      current_label.add_item(current_book)
      current_author.add_item(current_book)
      book_objects << current_book
      label_objects << current_label
      author_objects << current_author
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
      multiplayer = game['multiplayer']
      publish_date = game['publish_date']
      last_played_at = game['last_played_at']
      title = game['title']
      color = game['color']
      current_game = Game.new(multiplayer, publish_date, last_played_at)
      current_label = Label.new(title, color)
      current_label.add_item(current_game)
      game_objects << current_game
      label_objects << current_label
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
      publish_date = music_album['publish_date']
      on_spotify = music_album['on_spotify']
      title = music_album['title']
      color = music_album['color']
      name = music_album['name']
      current_music_album = MusicAlbum.new(publish_date, on_spotify)
      current_label = Label.new(title, color)
      current_genre = Genre.new(name)
      current_genre.add_item(current_music_album)
      current_label.add_item(current_music_album)
      music_album_objects << current_music_album
      label_objects << current_label
      genre_objects << current_genre
    end
    {
      'music_albums' => music_album_objects,
      'labels' => label_objects,
      'genres' => genre_objects
    }
  end
end
