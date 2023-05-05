require_relative 'item'
class Music < Item
  attr_accessor :on_spotify, :id_genre, :id_label, :id_author

  def initialize(public_date, on_spotify)
    super(public_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archive?
    super && @on_spotify
  end
end
