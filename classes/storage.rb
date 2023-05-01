require 'json'

class Storage
  attr_accessor :game, :book, :music
  attr_reader :game_path, :book_path, :music_path

  def initialize
    @game = []
    @book = []
    @music = []
    dir = File.dirname(__FILE__).slice(0...-7) << "storage/"
    file_game = 'game.json'
    file_book = 'book.json'
    file_music = 'music.json'
    @game_path = File.join(dir, file_game)
    @book_path = File.join(dir, file_book)
    @music_path = File.join(dir, file_music)
  end

  def open_file(path, key)
    if File.exist?(path) && !File.empty?(path)
      file = File.open(path, 'r')
      str = file.read
      aux_hash = JSON(str)
      @game = aux_hash[key] if key == 'game'
      @book = aux_hash[key] if key == 'book'
      @music = aux_hash[key] if key == 'music'
    else
      create_file(path, key)
    end
  end

  def create_file(path, key)
    case key
    when 'game'
      File.write(path, '{"game" : []}')
    when 'book'
      File.write(path, '{"book" : []}')
    when 'music'
      File.write(path, '{"music" : []}')
    end
  end

  def add_data(path, target, key)
    File.open(path, 'w')
    hash = { key => target }
    str = JSON(hash)
    File.write(path, str)
  end

  def acquire_data
    open_file(@game_path, 'game')
    open_file(@book_path, 'book')
    open_file(@music_path, 'music')
  end
end
