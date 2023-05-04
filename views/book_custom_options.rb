require_relative '../helpers/validators'
require_relative '../helpers/add_extra_info'
require_relative '../helpers/to_hash'

require_relative '../controllers/book'

require_relative '../classes/book'

class BookCustomOptions
  def show
    validator = Validators.new
    validator.validate_empty_all

    print 'Enter the public date [YYYY/MM/dd]: '
    public_date = gets.chomp

    print 'Enter the Cover State: '
    cover_state = gets.chomp.capitalize

    print 'Enter the publisher: '
    publisher = gets.chomp.capitalize

    id_genre = validator.select_genre
    id_label = validator.select_label
    id_author = validator.select_author

    book = Book.new(public_date, cover_state, publisher)
    final_book = ExtraInfo.new(book, id_genre, id_label, id_author)
    final_book.add_extra_info

    book_hashed = Hash.new(final_book.object).book_to_h
    BookController.new.save(book_hashed)
  end
end
