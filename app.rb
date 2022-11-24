require_relative './src/book/book'
require_relative './src/label/label'
require_relative './src/author/author'
require_relative './src/music_album/music_album'
require_relative './src/genre/genre'
require_relative './src/game/game'
require_relative './utils/msg'

class App
  attr_accessor :books, :albums, :authors, :genres, :labels, :games

  def initialize
    @books = []
    @albums = []
    @authors = []
    @genres = []
    @labels = []
    @games = []

    load_data
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
      add_new_book
    when 8
      add_new_album
    when 9
      add_new_game
    end
  end

  def start_program
    puts "\nWelcome to the catalog app  :)\n"
    until list_of_options
      input = gets.chomp.to_i
      if input.zero?
        save_data
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
      puts "\nALL BOOKS\n\n"
      puts "\nBooks \t| Publisher \t| Publish date \t| Cover state"
      @books.each { |book| puts "#{book.label.name} #{book.publisher} #{book.publish_date} #{book.cover_state}" }
    end
  end

  def list_all_labels
    if @labels.empty?
      Msg.new.error('Lables not available yet :(')
    else
      puts "\nALL LABELS\n\n"
      puts "\nLabels \t| Color"
      @labels.each do |label|
        puts "#{label.title} \t| #{label.color}"
        puts "\n----------------------------"
      end
    end
  end

  def list_all_albums
    if @albums.empty?
      Msg.new.error('Albums not available yet :(')
    else
      puts "\nALL ALBUMS\n\n"
      puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
      @albums.each do |album|
        puts "#{album.genre} \t| #{album.on_spotify} \t| #{album.label.name}
        \t| #{album.publish_date}"
        puts "\n---------------------------------------------------"
      end
    end
  end

  def list_all_games
    if @games.empty?
      Msg.new.error('Games not available yet :(')
    else
      puts "\nALL GAMES\n\n"
      puts "\Games \t| Multiplayer \t| Last Played At"
      @games.each do |game|
        puts "\t #{game.label.name} \t#{game.last_played_at} \t| #{game.multiplayer}"
        puts "\n-------------------------------------------------"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      Msg.new.error('Genres not available yet :(')
    else
      @genres.each do |genre|
        puts genre.name
        puts "\n----------------------------"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      Msg.new.error('Authors not available yet :(')
    else
      puts "\nALL AUTHORS\n\n"
      puts "\First Name \t| Last Name"
      @authors.each do |author|
        puts "#{author.first_name} \t| #{author.last_name}"
        puts "\n-------------------------------------------------"
      end
    end
  end

  def add_book; end

  def add_label; end

  def add_author; end

  def add_album; end

  def add_game; end

  def save_data; end

  def load_data; end
end
