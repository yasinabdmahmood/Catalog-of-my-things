module GetData
  def retrieve_data(path)
    File.write(path, '[]') unless File.exist?(path)
    file_data = File.read(path)
    JSON.parse(file_data)
  end

  def retrieve_books
    retrieve_data('data/books.json')
  end

  def retrieve_authors
    retrieve_data('data/authors.json')
  end

  def retrieve_labels
    retrieve_data('data/labels.json')
  end

  def retrieve_genres
    retrieve_data('data/genres.json')
  end

  def retrieve_games
    retrieve_data('data/games.json')
  end

  def retrieve_music_album
    retrieve_data('data/music_albums.json')
  end
end
