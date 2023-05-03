require_relative '../helpers/validators'
class MusicCustomOptions
  def show
    validator = Validators.new
    validator.validate_empty_all

    print 'Enter the public date [YYYY/MM/dd]: '
    # public_date = gets.chomp

    print 'Enter [Y]/[N] if the album is on spotify: '
    on_spotify = gets.chomp.downcase

    until on_spotify.is_a?(String) && %w[y n].include?(on_spotify)
      print 'Invalid input. Enter [Y]/[N] if the album is on spotify '
      on_spotify = gets.chomp.downcase
    end

    id_genre = validator.select_genre
    puts id_genre
  end
end
