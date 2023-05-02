require_relative 'item'
class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(public_date, multiplayer, last_played_at)
    super(public_date, genre, label, author)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archive?
    super && @multiplayer && last_played_at
  end
end
