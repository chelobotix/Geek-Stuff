require_relative '../classes/author'
require_relative '../controllers/author'

class AuthorCustomOptions
  def show_menu
    print 'Enter the First Name: '
    f_name = gets.chomp.capitalize
    print 'Enter the Last Name: '
    l_name = gets.chomp.capitalize

    author = Author.new(f_name, l_name)
    data = { id: author.id, first_name: author.first_name, last_name: author.last_name }
    AuthorController.new.save(data)
    puts 'Author created successfully'
    author.id
  end
end
