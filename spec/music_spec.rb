require_relative '../classes/music'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/genre'

describe Music do
  before :each do
    @music = Music.new '01/05/2018', true
    @label = Label.new 'Peaches', 'Peach'
    @author = Author.new 'Bowser', 'Kupa'
    @genre = Genre.new 'Rock'
  end
  context 'When testing the Music class section 1' do
    it 'music Object must be returned' do
      expect(@music).to be_an_instance_of Music
    end

    it 'Return correct on spotify' do
      expect(@music.on_spotify).to eql(true)
    end

    it 'add_label method should add label object to Music and Label class' do
      @music.add_label = @label
      expect(@music.label.title).to eql('Peaches')
      expect(@label.items[0]).to be_an_instance_of Music
    end

    it 'add_author method should add author object to Music and Author class' do
      @music.add_author = @author
      expect(@music.author.first_name).to eql('Bowser')
      expect(@author.items[0]).to be_an_instance_of Music
    end

    it 'add_genre method should add genre object to Music and Genre class' do
      @music.add_label = @genre
      expect(@music.genre.name).to eql('Rock')
      expect(@genre.items[0]).to be_an_instance_of Music
    end
  end

  context 'When testing the Music class section 2' do
    it 'Add Label to Music' do
      @music.add_label = @label
      expect(@music.label.title).to eql('Peaches')
      expect(@music.label).to be_an_instance_of Label
    end

    it 'Add Author to Music' do
      @music.add_author = @author
      expect(@music.author.first_name).to eql('Bowser')
      expect(@music.author).to be_an_instance_of Author
    end

    it 'Add Genre to Music' do
      @music.add_genre = @genre
      expect(@music.genre.name).to eql('Rock')
      expect(@music.genre).to be_an_instance_of Genre
    end

    it 'Method move_to_archive should return True if parent returns true or when is on_spotify' do
      @music.on_spotify = true
      @music.move_to_archive
      expect(@music.archived).to be false
    end

    it 'Method move_to_archive should return false if parent returns false or when is not on_spotify' do
      @music.on_spotify = false
      @music.move_to_archive
      expect(@music.archived).to be false
    end
  end
end
