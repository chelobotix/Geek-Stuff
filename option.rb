class Option
  def option_selector(_option)
    option_map = {
      '1' => 'list_all_books',
      '2' => 'list_all_music_albums',
      '3' => 'list_all_games',
      '4' => 'list_all_genres',
      '5' => 'list_all_labels',
      '6' => 'list_all_authors',
      '7' => 'list_all_sources',
      '8' => 'add_a_book',
      '9' => 'add_a_music_album',
      '10' => 'add_a_game',
      '11' => 'exit'
    }
    puts option_map
  end

  def list_all_books; end

  def list_all_music_albums; end

  def list_all_games; end

  def list_all_genres; end

  def list_all_labels; end

  def list_all_authors; end

  def list_all_sources; end

  def add_a_book; end

  def add_a_music_album; end

  def add_a_game; end
end
