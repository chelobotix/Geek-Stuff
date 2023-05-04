require_relative '../helpers/validators'

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
    id_title = validator.select_label
  end
end
