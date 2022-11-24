
require_relative './src/book/book'
require_relative './src/label/label'
require_relative './src/author/author'
require_relative './src/music_album/music_album'
require_relative './src/genre/genre'
require_relative './src/game/game'

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
    puts "\n"
    puts '      Choose an option by entering a number'
    puts '      1- List all books'
    puts '      2- List all Music albums'
    puts '      3- List all Games'
    puts '      4- List all Genres'
    puts '      5- List all Labels'
    puts '      6- List all Authors'
    puts '      7- Add a book'
    puts '      8- Add a music album'
    puts '      9- Add a game'
    puts '      0- Exit'
  end
  
  def option(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_albums
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      list_all_labels
    when '6'
      list_all_authors
    when '7'
      add_new_book_details
    when '8'
      add_new_album_details
    when '9'
      add_new_game_details
    end
  end

  def start_program
    puts "\n    Welcome to the catalog app  :)"
    until list_of_options
      input = gets.chomp
      if input == '0'
        preserve_files
        puts "\n    Thank you for using our app  :) \n "
        break
      end
      option(input)
    end
  end

  def list_all_books
    if @books.empty?
    puts 'No available books'
    else
    puts "\nALL BOOKS\n\n"
    puts "\nBooks \t| Publisher \t| Publish date \t| Cover state"
    @books.each { |book| puts "#{book.label.name} #{book.publisher} #{book.publish_date} #{book.cover_state}" }
    end
  end

  def list_all_labels
    if @labels.empty?
      puts "\nNote: No Label available."
    else
      puts "\nALL LABELS\n\n"
      puts "\nLabels \t| Color"
      @labels.each do |label|
        puts "#{label['title'].strip} \t| #{label['color']}"
        puts "\n----------------------------"
      end
    end
  end

  def list_all_albums
    if @albums.empty?
      puts "\nNote: No albums available."
    else
      puts "\nALL ALBUMS\n\n"
      puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
      @albums.each do |album|
        puts "#{album.genre} \t| #{album.on_spotify.to_s.strip.rjust(10)} \t| #{album.label.name.to_s.strip.rjust(10)} \t| #{album.publish_date.to_s.strip.rjust(10)}"
        puts "\n---------------------------------------------------"
      end
    end
  end

  def list_all_games
    if @games.empty?
      puts "\nNote: No games available."
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
      puts "\nNote: No genres available."
    else
      @genres.each do |genre|
        puts genre.name
        puts "\n----------------------------"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts "\nNote: No authors available."
    else
      puts "\nALL AUTHORS\n\n"
      puts "\First Name \t| Last Name"
      @authors.each do |author|
        puts "#{author.first_name} \t| #{author.last_name}"
        puts "\n-------------------------------------------------"
      end
    end
  end

  def add_book()
  
  end

  def add_label()

  end

  def add_author()
    
  end

  def add_album()
 
  end

  def add_game()
  
  end

  def save_data
    
  end

  def load_data
   
  end
end
