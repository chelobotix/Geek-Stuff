require 'date'

class Item
  attr_accessor :public_date
  attr_reader :genre, :label, :author, :archived

  def initialize(public_date)
    @id = Random.rand(1..1000)
    @public_date = Date.parse(public_date) # month/day/year
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archive? if can_be_archive?
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  private

  def can_be_archive?
    (Date.today - @public_date) >= 3652
  end
end
