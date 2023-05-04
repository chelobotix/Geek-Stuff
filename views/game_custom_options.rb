require_relative '../helpers/validators'
require_relative '../helpers/add_extra_info'
require_relative '../helpers/to_hash'

require_relative '../controllers/game'

require_relative '../classes/game'

class GameCustomOptions
  def show
    validator = Validators.new

    print 'Enter the public date [YYYY/MM/dd]: '
    public_date = gets.chomp

    print 'Enter [Y]/[N] if the game is multiplayer: '
    is_multiplayer = gets.chomp.downcase

    until is_multiplayer.is_a?(String) && %w[y n].include?(is_multiplayer)
      print 'Invalid input. Enter [Y]/[N] if the album is on spotify '
      is_multiplayer = gets.chomp.downcase
    end

    print 'Enter the last played date [YYYY/MM/dd]: '
    last_date = gets.chomp

    id_genre = validator.select_genre
    id_label = validator.select_label
    id_author = validator.select_author

    game = Game.new(public_date, is_multiplayer == 'y', last_date)

    final_game = ExtraInfo.new(game, id_genre, id_label, id_author)
    final_game.add_extra_info

    game_hashed = Hash.new(final_game.object).game_to_h
    GameController.new.save(game_hashed)
  end
end
