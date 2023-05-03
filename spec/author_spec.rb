require_relative '../classes/game'
require_relative '../classes/author'

describe Author do
  before :each do
    @author = Author.new 'Blizzard', 'Company'
    @game = Game.new '01/05/2011', true, '01/05/2022'
  end
  context 'When testing the Author class' do
    it 'Add Game to Author' do
      @author.add_item(@game)
      expect(@author.items[0]).to be_an_instance_of Game
      expect(@game.author.first_name).to eql('Blizzard')
    end

    it 'Check Author "items" array length' do
      @author.add_item(@game)
      expect(@author.items.length).to eql(1)
    end
  end
end
