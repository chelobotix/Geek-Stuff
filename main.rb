require_relative 'views/interface'
class Main
  def run
    Interface.new.show_menu
  end
end

Main.new.run
