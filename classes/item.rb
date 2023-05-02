require 'date'
class Item
  attr_accessor :genre_id, :author_id, :source_id, :label_id, :public_date
  attr_reader :genres, :authors, :sources, :labels

  def initialize(genre_id, author_id, source_id, label_id, public_date)
    @id = Random.rand(1..1000)
    @genre_id = genre_id
    @author_id = author_id
    @source_id = source_id
    @label_id = label_id
    @public_date = Date.parse(public_date) # month/day/year
    @archived = false

    @genres = []
    @authors = []
    @sources = []
    @labels = []
  end

  def move_to_archive
    @archived = can_be_archive? if can_be_archive?
  end

  def add_genre(genre)
    @genres << genre
  end

  def add_author(author)
    @authors << author
  end

  def add_source(source)
    @sources << source
  end

  def add_label(label)
    @labels << label
  end

  private

  def can_be_archive?
    (Date.today - @public_date) >= 3652
  end
end
