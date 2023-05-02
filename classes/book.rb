require_relative 'item'


class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(public_date, cover_state, publisher)
    super(public_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archive?
    super || @cover_state == 'bad'
  end
end
