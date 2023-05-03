# require_relative 'label'
# require_relative 'author'
# require_relative 'genre'
# require_relative 'book'
# require_relative 'music'
# require_relative 'game'

class App
  def initialize(option)
    @option = option
    @storage = option.main.storage
    @game = @storage.game
    @books = @storage.book
    @music = @storage.music
  end

  def ask_user(str)
    puts str
    gets.chomp
  end
end

# label1 = Label.new('Gift', 'Blue')
# author1 = Author.new('John', 'Smith')
# genre1 = Genre.new('Historical')

# book1 = Book.new('24/12/2017','good', 'NY Editorial')
# book1.add_author = author1
# puts book1.author
# puts author1.items

# book1.add_label = (label1)
# puts book1.label
# puts label1.items

# book1.add_genre = genre1
# puts book1.genre
# puts genre1.items

# #######################
# puts 'other'

# music1 = Music.new('15/06/1018', 'yes')
# game1 = Game.new('31/08/2015', 'yes', '02-02-2021')
# label1.add_item(music1)
# puts label1.items
# puts 'other'
# puts author1.add_item(game1)
# puts game1.author
