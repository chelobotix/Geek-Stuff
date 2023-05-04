require_relative 'music_custom_options'
require_relative 'book_custom_options'

require_relative '../app'

require_relative '../controllers/music'
require_relative '../controllers/genre'
require_relative '../controllers/author'
require_relative '../controllers/game'
require_relative '../controllers/label'
require_relative '../controllers/book'

class Option
  def initialize
    @music_albums = MusicController.new
    @genres = GenreController.new
    @authors = AuthorController.new
    @games = GameController.new
    @labels = LabelController.new
    @books = BookController.new
  end

  def option_selector(option)
    option_map = {
      1 => 'list_all_books',
      2 => 'list_all_music_albums',
      3 => 'list_all_games',
      4 => 'list_all_genres',
      5 => 'list_all_labels',
      6 => 'list_all_authors',
      7 => 'add_a_book',
      8 => 'add_a_music_album',
      9 => 'add_a_game',
      10 => 'exit'
    }
    send(option_map[option])
  end

  def list_all_books
    if @books.list.empty?
      puts 'There are not music albums yet'
      return
    end
    puts '----- Books -----'
    @books.list.each do |book|
      puts "[#{book['id']}] Date: #{book['public_date']}, Publisher: #{book['publisher']}, Cover State: #{book['cover_state']},
      Author:#{get_author_name(book)},
      Genre: #{get_genre_name(book)},
      Label: #{get_label_title(book)}"
    end
  end

  def list_all_music_albums
    if @music_albums.list.empty?
      puts 'There are not music albums yet'
      return
    end
    puts '----- Music albums -----'
    @music_albums.list.each do |album|
      puts "[#{album['id']}] Date: #{album['public_date']}, On Spotify: #{album['on_spotify']},
      Author:#{get_author_name(album)},
      Genre: #{get_genre_name(album)},
      Label: #{get_label_title(album)}"
    end
  end

  def list_all_games
    if @games.list.empty?
      puts 'There are not authors yet'
      return
    end
    puts '----- Games -----'
    @games.list.each do |game|
      puts "[#{game['id']}] Multiplayer: #{game['multiplayer']},
      Author:#{get_author_name(game)},
      Genre: #{get_genre_name(game)},
      Label: #{get_label_title(game)}"
    end
  end

  def list_all_genres
    if @genres.list.empty?
      puts 'There are not genders yet'
      return
    end
    puts '----- Genders -----'
    @genres.list.each { |genre| puts "[#{genre['id']}] Name: #{genre['name']}" }
  end

  def list_all_labels
    if @labels.list.empty?
      puts 'There are not labels yet'
      return
    end
    puts '----- Labels -----'
    @labels.list.each { |label| puts "[#{label['id']}] Title: #{label['title']}, Color: #{label['color']}" }
  end

  def list_all_authors
    if @authors.list.empty?
      puts 'There are not authors yet'
      return
    end
    puts '----- Authors -----'
    @authors.list.each { |author| puts "[#{author['id']}] Name: #{author['first_name']} #{author['last_name']}" }
  end

  def add_a_book
    BookCustomOptions.new.show
  end

  def add_a_music_album
    MusicCustomOptions.new.show
  end

  def add_a_game; end

  private

  def get_author_name(obj)
    aux = @authors.list.map do |author|
      obj['author_id'] == author['id'] ? "#{author['first_name']} #{author['last_name']}" : nil
    end
    aux.find { |name| name } || 'Author not found or has been removed'
  end

  def get_genre_name(obj)
    aux = @genres.list.map do |genre|
      obj['genre_id'] == genre['id'] ? (genre['name']).to_s : nil
    end
    aux.find { |name| name } || 'Genre not found or has been removed'
  end

  def get_label_title(obj)
    aux = @labels.list.map do |label|
      obj['label_id'] == label['id'] ? (label['title']) : nil
    end
    aux.find { |name| name } || 'Label not found or has been removed'
  end
end
