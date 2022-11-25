require_relative '../utils/helper'

def load_data
  all_books = Helper.retrieve_books
  all_games = Helper.retrieve_games
  all_music = Helper.retrieve_music_album
  [all_books, all_games, all_music]
end