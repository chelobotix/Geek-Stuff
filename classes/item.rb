require 'date'
class Item
  attr_accessor :author, :source, :public_date
  attr_reader :genre, :label

  def initialize(author, source, label, public_date)
    @id = Random.rand(1..1000)
    @author = author
    @source = source
    @label = label
    @public_date = Date.parse(public_date) # month/day/year
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archive? if can_be_archive?
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.includes?(self)
  end

  def add_label=(label)
    @label = label
    label.add_item(self) unless label.items.includes?(self)
  end

  private

  def can_be_archive?
    (Date.today - @public_date) >= 3652
  end
end
