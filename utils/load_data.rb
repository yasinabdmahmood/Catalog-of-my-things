require_relative '../utils/helper'

def load_data
  all_books = Helper.retrieve_books
  all_games = Helper.retrieve_games
  all_music = Helper.retrieve_music_album
  all_authors = Helper.retrieve_authors
  all_labels = Helper.retrieve_labels
  all_genres = Helper.retrieve_genres
  [all_books, all_games, all_music, all_authors, all_labels, all_genres]
end
