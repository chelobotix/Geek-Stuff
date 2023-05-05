require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id_label, :id_genre, :id_author

  def initialize(public_date, multiplayer, last_played_at)
    super(public_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archive?
    super && (Date.today - @last_played_at) >= 730
  end
end
