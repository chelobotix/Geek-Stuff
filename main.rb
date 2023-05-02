require_relative './classes/option'
require_relative './classes/storage'

class Main
  attr_reader :storage

  def initialize
    @storage = Storage.new
    @program = true
    acquire_data
    @option = Option.new(self)
    show_menu
  end

  def acquire_data
    @storage.acquire_data
  end

  def show_menu
    puts "
      1  List all books
      2  List all music albums
      3  List of games
      4  List all genres
      5  List all labels
      6  List all authors
      7  Add a book
      8  Add a music album
      9 Add a game
      10 EXIT
    "
    select_option
  end

  def select_option()
    while @program
      begin
        op = Integer(gets.chomp)
        raise ArgumentError unless (1...11).include?(op)

        @option.option_selector(op)
        show_menu
      rescue ArgumentError
        puts 'Invalid input. Please enter a number from 1 to 10'
      end
    end
  end
end

Main.new
