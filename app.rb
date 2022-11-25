require_relative './utils/add_items'
require_relative './utils/load_data'
require_relative './utils/helper'
require_relative './utils/msg'
require 'table_print'

class App
  attr_accessor :books, :albums, :authors, :genres, :labels, :games

  def initialize
    @books = []
    @albums = []
    @authors = []
    @genres = []
    @labels = []
    @games = []
  end

  def list_of_options
    print <<~DOC

      -------------------------------------
      Choose an option by entering a number

      1- List all books
      2- List all Music albums
      3- List all Games
      4- List all Genres
      5- List all Labels
      6- List all Authors
      7- Add a book
      8- Add a music album
      9- Add a game
      0- Exit

    DOC
    print 'Enter you choice : '
  end

  def list(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_albums
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    end
  end

  def add(input)
    case input
    when 7
      book, label, author = add_new_book
      @books << book
      @labels << label
      @authors << author
      Msg.new.success('Book Added Successfully !!')
    when 8
      music_album, label, genre = add_new_album
      @albums << music_album
      @labels << label
      @genres << genre
      Msg.new.success('Music Album Added Successfully !!')
    when 9
      game, label = add_new_game
      @games << game
      @labels << label
      Msg.new.success('Game Added Successfully !!')
    end
  end

  def start_program
    books, games, albums, authors, labels, genres = load_data
    @books = books
    @games = games
    @albums = albums
    @authors = authors
    @labels = labels
    @genres = genres
    puts "\nWelcome to the catalog app  :)\n"
    until list_of_options
      input = gets.chomp.to_i
      if input.zero?
        # save_data
        Msg.new.success('Thank you for using our app  :)')
        break
      end
      list(input) if [1, 2, 3, 4, 5, 6].include? input
      add(input) if [7, 8, 9].include? input
    end
  end

  def list_all_books
    if @books.empty?
      Msg.new.error('Books not available yet :(')
    else
      puts
      @books = Helper.retrieve_books
      tp @books
    end
  end

  def list_all_labels
    if @labels.empty?
      Msg.new.error('Lables not available yet :(')
    else
      puts
      @labels = Helper.retrieve_labels
      tp @labels
    end
  end

  def list_all_albums
    if @albums.empty?
      Msg.new.error('Albums not available yet :(')
    else
      puts
      @albums = Helper.retrieve_music_album
      tp @albums
    end
  end

  def list_all_games
    if @games.empty?
      Msg.new.error('Games not available yet :(')
    else
      puts
      @games = Helper.retrieve_games
      tp @games
    end
  end

  def list_all_genres
    if @genres.empty?
      Msg.new.error('Genres not available yet :(')
    else
      puts
      @genres = Helper.retrieve_genres
      tp @genres
    end
  end

  def list_all_authors
    if @authors.empty?
      Msg.new.error('Authors not available yet :(')
    else
      puts
      @authors = Helper.retrieve_authors
      tp @authors
    end
  end
end
