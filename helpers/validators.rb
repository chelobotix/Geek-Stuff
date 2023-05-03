require_relative '../controllers/genre'
class Validators
  def initialize
    @genres = GenreController.new.list
  end

  def select_genre
    puts "\nSelect a genre [ID]: "
    @genres.each { |genre| puts "[#{genre['id']}] Name: #{genre['name']}" }
    id_genre = gets.chomp.to_i
    return id_genre if @genres.any? { |genre| genre['id'] == id_genre }

    puts "\n Please select a valid [ID]"
    select_genre
  end

  def validate_empty_all
    validate_empty_each('genres', @genres)
    # validate_empty_each('authors', @author)
    # validate_empty_each('labels', @label)
  end

  private

  def validate_empty_each(list_name, list)
    return unless list.empty?

    puts "There are not #{list_name} yet"
    Interface.new.show_menu
  end
end
