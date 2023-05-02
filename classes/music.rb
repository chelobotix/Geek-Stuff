require_relative 'item'
class Music < Item
  attr_accessor :on_spotify

  def initialize(public_date, on_spotify)
    super(public_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archive?
    super && @on_spotify
  end
end
