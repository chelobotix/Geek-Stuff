require_relative 'music_custom_options'

require_relative '../app'

require_relative '../controllers/music'
require_relative '../controllers/genre'
require_relative '../controllers/author'
require_relative '../controllers/game'

class Option
  def initialize
    @music_albums = MusicController.new
    @genres = GenreController.new
    @authors = AuthorController.new
    @games = GameController.new
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

  def list_all_books; end

  def list_all_music_albums
    if @music_albums.list.empty?
      puts 'There are not music albums yet'
      return
    end
    puts '----- Music albums -----'
    @music_albums.list.each do |album|
      puts "[#{album['id']}] Date: #{album['public_date']}, On Spotify: #{album['on_spotify']}"
    end
  end

  def list_all_games
    if @games.list.empty?
      puts 'There are not authors yet'
      return
    end

    puts '----- Games -----'
    @games.list.each do |game|
      author_name = @authors.list.map do |author|
        game['author_id'] == author['id'] ? "#{author['first_name']} #{author['last_name']}" : nil
      end.find { |name| name } || 'Author not found or has been removed'

      genre_name = @genres.list.map do |genre|
        game['genre_id'] == genre['id'] ? (genre['name']).to_s : nil
      end.find { |name| name } || 'Genre not found or has been removed'

      puts "[#{game['id']}] Multiplayer: #{game['multiplayer']}, Author:#{author_name}, Genre: #{genre_name}"
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

  def list_all_labels; end

  def list_all_authors
    if @authors.list.empty?
      puts 'There are not authors yet'
      return
    end
    puts '----- Authors -----'
    @authors.list.each { |author| puts "[#{author['id']}] Name: #{author['first_name']} #{author['last_name']}" }
  end

  def add_a_book; end

  def add_a_music_album
    MusicCustomOptions.new.show
  end

  def add_a_game; end
end
