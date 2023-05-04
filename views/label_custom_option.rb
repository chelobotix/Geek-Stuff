require_relative '../classes/label'
require_relative '../controllers/label'

class LabelCustomOptions
  def show_menu
    print 'Enter the title: '
    title = gets.chomp.capitalize
    print 'Enter the color: '
    color = gets.chomp.capitalize

    label = Label.new(title, color)
    data = { id: label.id, title: label.title, color: label.color }
    LabelController.new.save(data)
    puts 'Label created successfully'
    label.id
  end
end
