require_relative '../classes/music'
require_relative '../classes/genre'

describe Genre do
  before :each do
    @genre = Genre.new 'Rock'
    @music = Music.new '01/05/2018', true
  end
  context 'When testing the Genre class' do
    it 'Add Music to Genre' do
      @genre.add_item(@music)
      expect(@genre.items[0]).to be_an_instance_of Music
      expect(@music.genre.name).to eql('Rock')
    end

    it 'Check Genre "items" array length' do
      @genre.add_item(@music)
      expect(@genre.items.length).to eql(1)
    end
  end
end
