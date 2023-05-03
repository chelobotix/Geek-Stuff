require_relative '../classes/game'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/genre'

describe Game do
  before :each do
    @game = Game.new '01/05/2011', true, '01/05/2022'
    @label = Label.new 'StarCraft', 'green'
    @author = Author.new 'Blizzard', 'Company'
    @genre = Genre.new 'SciFi'
  end

  context 'When testing the Game class section one' do
    it 'Game Object must be returned' do
      expect(@game).to be_an_instance_of Game
    end

    it 'Return Multiplayer state ' do
      expect(@game.multiplayer).to eql(true)
    end

    it 'add_label method should add label object to Game and Label class' do
      @game.add_label = @label
      expect(@game.label.title).to eql('StarCraft')
      expect(@label.items[0]).to be_an_instance_of Game
    end

    it 'add_author method should add author object to Game and Author class' do
      @game.add_author = @author
      expect(@game.author.first_name).to eql('Blizzard')
      expect(@author.items[0]).to be_an_instance_of Game
    end

    it 'add_genre method should add genre object to Game and Genre class' do
      @game.add_label = @genre
      expect(@game.genre.name).to eql('SciFi')
      expect(@genre.items[0]).to be_an_instance_of Game
    end
  end
  context 'When testing the Game class section two' do
    it 'Add Author to Game' do
      @game.add_label = @author
      expect(@game.author.first_name).to eql('Blizzard')
    end

    it 'Add Genre to Game' do
      @game.add_label = @genre
      expect(@game.genre.name).to eql('SciFi')
    end

    it 'Move_to_archive should return True if parent returns true when last_played is not older than two years' do
      @game.last_played_at = Date.parse('01/05/2023')
      @game.move_to_archive
      expect(@game.archived).to be false
    end

    it 'Move_to_archive should return false if parent returns true and when last_played is older than two years' do
      @game.last_played_at = Date.parse('01/05/2015')
      @game.move_to_archive
      expect(@game.archived).to be true
    end
  end
end
