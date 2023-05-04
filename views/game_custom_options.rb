require_relative '../helpers/validators'
class GameCustomOptions
  def show
    validator = Validators.new
    validator.validate_empty_all

    print 'Enter the public date [YYYY/MM/dd]: '
    public_date = gets.chomp

    print 'Enter [Y]/[N] if the game is multiplayer: '
    is_multiplayer = gets.chomp.downcase

    until is_multiplayer.is_a?(String) && %w[y n].include?(is_multiplayer)
      print 'Invalid input. Enter [Y]/[N] if the album is on spotify '
      is_multiplayer = gets.chomp.downcase
    end
    is_multiplayer = is_multiplayer == 'y' ? true : false

    id_genre = validator.select_genre
    id_label = validator.select_label
    id_author = validator.select_author

    print 'Enter the last played date [YYYY/MM/dd]: '
    last_date = gets.chomp

    puts id_genre
  end
end