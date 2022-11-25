require 'json'
module StoreData
  def store(path, hash)
    File.write(path, '[]') unless File.exist?(path)
    file_data = File.read(path)
    array = JSON.parse(file_data)
    array << hash
    json = JSON.pretty_generate(array)
    File.write(path, "#{json}\n", mode: 'w')
  end

  def store_book(book)
    hashed_book = {
      'id' => book.id,
      'title' => book.label.title,
      'publisher' => book.publisher,
      'publish_date' => book.publish_date,
      'color' => book.label.color,
      'author_name' => "#{book.author.first_name} #{book.author.last_name}",
      'cover_state' => book.cover_state
    }
    store('data/books.json', hashed_book)
  end

  def store_music_album(music_album)
    hashed_music_album = {
      'id' => music_album.id,
      'music_title' => music_album.label.title,
      'genre_name' => music_album.genre.name,
      'publish_date' => music_album.publish_date,
      'label_color' => music_album.label.color,
      'on_spotify' => music_album.on_spotify
    }
    store('data/music_albums.json', hashed_music_album)
  end

  def store_game(game)
    hashed_game = {
      'id' => game.id,
      'game_title' => game.label.title,
      'game_color' => game.label.color,
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at,
      'publish_date' => game.publish_date
    }
    store('data/games.json', hashed_game)
  end

  def store_author(author)
    hashed_game = {
      'id' => author.id,
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }
    store('data/authors.json', hashed_game)
  end

  def store_label(label)
    hashed_game = {
      'id' => label.id,
      'label_name' => label.title,
      'label_color' => label.color
    }
    store('data/labels.json', hashed_game)
  end

  def store_genre(genre)
    hashed_game = {
      'id' => genre.id,
      'genre_name' => genre.name
    }
    store('data/genres.json', hashed_game)
  end
end
