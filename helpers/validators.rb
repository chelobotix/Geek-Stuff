require_relative '../controllers/genre'
require_relative '../controllers/label'
require_relative '../controllers/author'
class Validators
  def initialize
    @genres = GenreController.new.list
    @labels = LabelController.new.list
    @authors = AuthorController.new.list
  end

  def select_genre
    puts "\nSelect a genre [ID]: "
    @genres.each { |genre| puts "[#{genre['id']}] Name: #{genre['name']}" }
    id_genre = gets.chomp.to_i
    return id_genre if @genres.any? { |genre| genre['id'] == id_genre }

    puts "\n Please select a valid [ID]"
    select_genre
  end

  def select_label
    puts "\nSelect a label [ID]: "
    @labels.each { |label| puts "[#{label['id']}], Title: #{label['title']},Color: #{label['color']}" }
    id_title = gets.chomp.to_i
    return id_title if @labels.any? { |label| label['id'] == id_title }

    puts "\n Please select a valid [ID]"
    select_label
  end

  def validate_empty_all
    validate_empty_each('genres', @genres)
    validate_empty_each('authors', @authors)
    validate_empty_each('labels', @labels)
  end

  def select_author
    puts "\nSelect an author [ID]: "
    @authors.each { |author| puts "[#{author['id']}], Name: #{author['first_name']} #{author['last_name']}" }
    id_author = gets.chomp.to_i
    return id_author if @authors.any? { |author| author['id'] == id_author }

    puts "\n Please select a valid [ID]"
    select_author
  end

  private

  def validate_empty_each(list_name, list)
    return unless list.empty?

    puts "There are not #{list_name} yet"
    Interface.new.show_menu
  end
end
