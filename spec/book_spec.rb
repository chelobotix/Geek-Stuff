require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/genre'

describe Book do
  before :each do
    @book = Book.new '01/05/2018', 'Good', 'Lewandosky Editorial'
    @label = Label.new 'Rome War', 'Blue'
    @author = Author.new 'John', 'Smith'
    @genre = Genre.new 'Adventure'

  end
  context 'When testing the Book class' do
    it 'Book Object must be returned' do
      expect(@book).to be_an_instance_of Book
    end

    it 'Return correct cover_state' do
      expect(@book.cover_state).to eql('Good')
    end

    it 'add_label method should add label object to Book and Label class' do
      @book.add_label = @label
      expect(@book.label.title).to eql('Rome War')
      expect(@label.items[0]).to be_an_instance_of Book
    end

    it 'add_author method should add author object to Book and Author class' do
      @book.add_author = @author
      expect(@book.author.first_name).to eql('John')
      expect(@author.items[0]).to be_an_instance_of Book
    end

    it 'add_genre method should add genre object to Book and Genre class' do
      @book.add_label = @genre
      expect(@book.genre.name).to eql('Adventure')
      expect(@genre.items[0]).to be_an_instance_of Book
    end

    it 'Add Label to Book' do
      @book.add_label = @label
      expect(@book.label.title).to eql('Rome War')
      expect(@book.label).to be_an_instance_of Label
    end

    it 'Add Author to Book' do
      @book.add_author = @author
      expect(@book.author.first_name).to eql('John')
      expect(@book.author).to be_an_instance_of Author
    end

    it 'Add Genre to Book' do
      @book.add_genre = @genre
      expect(@book.genre.name).to eql('Adventure')
      expect(@book.genre).to be_an_instance_of Genre
    end

    it 'Method move_to_archive should return True if parent method returns true or when cover_state = "bad"' do
      @book.cover_state = 'bad'
      @book.move_to_archive
      expect(@book.archived).to be true
    end

    it 'Method move_to_archive should return false if parent method returns false or when cover_state != "bad"' do
      @book.cover_state = 'good'
      @book.move_to_archive
      expect(@book.archived).to be false
    end
  end
end
