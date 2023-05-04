require_relative '../helpers/validators'
require_relative '../helpers/add_extra_info'
require_relative '../helpers/to_hash'

require_relative '../controllers/music'

require_relative '../classes/music'

class MusicCustomOptions
  def show
    validator = Validators.new
    # validator.validate_empty_all

    print 'Enter the public date [YYYY/MM/dd]: '
    public_date = gets.chomp

    print 'Enter [Y]/[N] if the album is on spotify: '
    on_spotify = gets.chomp.downcase

    until on_spotify.is_a?(String) && %w[y n].include?(on_spotify)
      print 'Invalid input. Enter [Y]/[N] if the album is on spotify '
      on_spotify = gets.chomp.downcase
    end

    on_spotify = on_spotify == 'y'

    id_genre = validator.select_genre
    id_label = validator.select_label
    id_author = validator.select_author

    music_album = Music.new(public_date, on_spotify)

    final_music = ExtraInfo.new(music_album, id_genre, id_label, id_author)
    final_music.add_extra_info

    music_hashed = Hash.new(final_music.object).music_to_h
    MusicController.new.save(music_hashed)
  end
end
