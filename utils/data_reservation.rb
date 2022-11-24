require 'json'
module UserInput
  def ask_for_user_inputs(*messages)
    user_inputs = []
    messages.each do |message|
      puts message
      user_inputs << gets.chomp
    end
    user_inputs
  end
end

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
      'publisher' => book.publisher,
      'publish_date' => book.publish_date,
      'cover_state' => book.cover_state,
      'title' => book.label.title,
      'color' => book.label.color,
      'first_name' => book.author.first_name,
      'last_name' => book.author.last_name
    }
    store('data/books.json', hashed_book)
  end

  def store_music_album(music_album)
    hashed_music_album = {
      'on_spotify' => music_album.on_spotify,
      'publish_date' => music_album.publish_date,
      'title' => music_album.label.title,
      'color' => music_album.label.color,
      'name' => music_album.genre.name
    }
    store('data/music_albums.json', hashed_music_album)
  end

  def store_game(game)
    hashed_game = {
      'multiplayer' => game.multiplayer,
      'publish_date' => game.publish_date,
      'last_played_at' => game.last_played_at,
      'title' => game.label.title,
      'color' => game.label.color
    }
    store('data/games.json', hashed_game)
  end
end

module GetData
  def retrieve_data(path)
    File.write(path, '[]') unless File.exist?(path)
    file_data = File.read(path)
    JSON.parse(file_data)
  end

  def retrive_books
    retrieve_data('data/books.json')
  end

  def retrieve_games
    retrieve_data('data/games.json')
  end

  def retrieve_music_album
    retrieve_data('data/music_albums.json')
  end
end
