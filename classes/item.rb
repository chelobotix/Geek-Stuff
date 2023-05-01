require 'date'
class Item
  attr_accessor :genre, :author, :source, :label, :public_date

  def initialize(genre, author, source, label, public_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @public_date = Date.parse(public_date) # month/day/year
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archive? if can_be_archive?
  end

  private

  def can_be_archive?
    (Date.today - @public_date) >= 3652
  end
end
