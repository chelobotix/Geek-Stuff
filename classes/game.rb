require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(public_date, multiplayer, last_played_at, genre, label, author)
    super(public_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at  
  end

  def can_be_archive?
    super && (Date.today - Date.parse(@last_played_at)) <= 730
  end
end

prueba = Game.new("2003/02/01", true, "2023/01/01", "terror", "Resident", "blizard")
print prueba.can_be_archive?