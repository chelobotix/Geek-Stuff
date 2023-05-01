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
