class ExtraInfo
  attr_accessor :object, :id_genre, :id_label, :id_author

  def initialize(object, id_genre, id_label, id_author)
    @object = object
    @id_genre = id_genre
    @id_label = id_label
    @id_author = id_author
  end

  def add_extra_info
    @object.id_label = @id_label
    @object.id_genre = @id_genre
    @object.id_author = @id_author
    @object
  end
end
