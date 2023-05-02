require_relative 'item'
class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(public_date, on_spotify)
    super(public_date)
    @on_spotify = on_spotify
  end

  def can_be_archive?
    super && @on_spotify
  end
end
