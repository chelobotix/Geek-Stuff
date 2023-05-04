class Hash
  def initialize(object)
    @object = object
  end

  def music_to_h
    id = @object.instance_variable_get(:@id)
    public_date = @object.instance_variable_get(:@public_date).strftime('%d/%m/%Y')
    on_spotify = @object.instance_variable_get(:@on_spotify)
    label_id = @object.instance_variable_get(:@id_label)
    genre_id = @object.instance_variable_get(:@id_genre)
    author_id = @object.instance_variable_get(:@id_author)
    {
      'id' => id,
      'public_date' => public_date,
      'on_spotify' => on_spotify,
      'label_id' => label_id,
      'genre_id' => genre_id,
      'author_id' => author_id
    }
  end

  def book_to_h
    id = @object.instance_variable_get(:@id)
    public_date = @object.instance_variable_get(:@public_date).strftime('%d/%m/%Y')
    archived = @object.instance_variable_get(:@archived)
    cover_state = @object.instance_variable_get(:@cover_state)
    publisher = @object.instance_variable_get(:@publisher)
    label_id = @object.instance_variable_get(:@id_label)
    genre_id = @object.instance_variable_get(:@id_genre)
    author_id = @object.instance_variable_get(:@id_author)
    {
      'id' => id,
      'public_date' => public_date,
      'archived' => archived,
      'cover_state' => cover_state,
      'publisher' => publisher,
      'label_id' => label_id,
      'genre_id' => genre_id,
      'author_id' => author_id
    }
  end

  def game_to_h
    id = @object.instance_variable_get(:@id)
    public_date = @object.instance_variable_get(:@public_date).strftime('%d/%m/%Y')
    archived = @object.instance_variable_get(:@archived)
    multiplayer = @object.instance_variable_get(:@multiplayer)
    last_played_at = @object.instance_variable_get(:@last_played_at).strftime('%d/%m/%Y')
    label_id = @object.instance_variable_get(:@id_label)
    genre_id = @object.instance_variable_get(:@id_genre)
    author_id = @object.instance_variable_get(:@id_author)
    {
      'id' => id,
      'public_date' => public_date,
      'archived' => archived,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at,
      'label_id' => label_id,
      'genre_id' => genre_id,
      'author_id' => author_id
    }
  end
end
