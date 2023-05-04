require_relative '../classes/genre'
require_relative '../controllers/genre'

class GenreCustomOptions
  def show_menu
    print 'Enter the name: '
    name = gets.chomp.capitalize

    genre = Genre.new(name)
    data = { id: genre.id, name: genre.name }
    GenreController.new.save(data)
    puts 'Genre created successfully'
    genre.id
  end
end
