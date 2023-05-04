class Hash
  def music_to_h(object)
    id = object.instance_variable_get(:@id)
    public_date = object.instance_variable_get(:@public_date).strftime('%d/%m/%Y')
    on_spotify = object.instance_variable_get(:@on_spotify)
    label_id = object.instance_variable_get(:@id_label)
    genre_id = object.instance_variable_get(:@id_genre)
    author_id = object.instance_variable_get(:@id_author)
    {
      'id' => id,
      'public_date' => public_date,
      'on_spotify' => on_spotify,
      'label_id' => label_id,
      'genre_id' => genre_id,
      'author_id' => author_id
    }
  end
end
