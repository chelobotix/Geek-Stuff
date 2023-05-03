require_relative 'music_custom_options'

require_relative '../app'

require_relative '../controllers/music'
require_relative '../controllers/genre'

class Option
  def initialize
    @music_albums = MusicController.new
    @genres = GenreController.new
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

  def list_all_games; end

  def list_all_genres
    if @genres.list.empty?
      puts 'There are not genders yet'
      return
    end
    puts '----- Genders -----'
    @genres.list.each { |genre| puts "[#{genre['id']}] Name: #{genre['name']}" }
  end

  def list_all_labels; end

  def list_all_authors; end

  def list_all_sources; end

  def add_a_book; end

  def add_a_music_album
    MusicCustomOptions.new.show
  end

  def add_a_game; end
end
