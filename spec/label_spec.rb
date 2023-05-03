require_relative '../classes/book'
require_relative '../classes/label'

describe Book do
  before :each do
    @label = Label.new 'Rome War', 'Blue'
    @book = Book.new '01/05/2018', 'Good', 'Lewandosky Editorial'
  end
  context 'When testing the Label class' do
    it 'Add Book to Label' do
      @label.add_item(@book)
      expect(@label.items[0]).to be_an_instance_of Book
      expect(@book.label.title).to eql('Rome War')
    end

    it 'Check Label "items" array length' do
      @label.add_item(@book)
      expect(@label.items.length).to eql(1)
    end
  end
end
