require_relative '../controllers/genre'
require_relative '../controllers/label'
require_relative '../controllers/author'

require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../views/label_custom_option'
require_relative '../views/author_custom_option'
require_relative '../views/genre_custom_option'

class Validators
  def initialize
    @genres = GenreController.new.list
    @labels = LabelController.new.list
    @authors = AuthorController.new.list
  end

  def select_genre
    validate_empty_each('genre', @genres)
    puts "\nSelect a genre [ID]: "
    @genres.each { |genre| puts "[#{genre['id']}] Name: #{genre['name']}" }
    print 'Press [0] if you want to create a new one: '
    id_genre = gets.chomp.to_i
    if id_genre.zero?
      id_genre = get_new_option('genre')
      @genres = GenreController.new.list
    end
    return id_genre if @genres.any? { |genre| genre['id'] == id_genre }

    puts "\n Please select a valid [ID]"
    select_genre
  end

  def select_author
    validate_empty_each('author', @authors)
    puts "\nSelect an author [ID]: "
    @authors.each { |author| puts "[#{author['id']}], Name: #{author['first_name']} #{author['last_name']}" }
    print 'Press [0] if you want to create a new one: '
    id_author = gets.chomp.to_i
    if id_author.zero?
      id_author = get_new_option('author')
      @authors = AuthorController.new.list
    end
    return id_author if @authors.any? { |author| author['id'] == id_author }

    puts "\n Please select a valid [ID]"
    select_author
  end

  def select_label
    validate_empty_each('label', @labels)
    puts "\nSelect a label [ID]: "
    @labels.each { |label| puts "[#{label['id']}], Title: #{label['title']},Color: #{label['color']}" }
    print 'Press [0] if you want to create a new one: '
    id_label = gets.chomp.to_i
    if id_label.zero?
      id_label = get_new_option('label')
      @labels = LabelController.new.list
    end
    return id_label if @labels.any? { |label| label['id'] == id_label }

    puts "\n Please select a valid [ID]"
    select_label
  end

  private

  def validate_empty_each(list_name, list)
    return unless list.empty?

    puts "There are not #{list_name} yet"
  end

  def get_new_option(list_name)
    case list_name
    when 'label'
      LabelCustomOptions.new.show_menu
    when 'author'
      AuthorCustomOptions.new.show_menu
    when 'genre'
      GenreCustomOptions.new.show_menu
    end
  end
end
