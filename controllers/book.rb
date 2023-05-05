require_relative '../helpers/data_manager'
class BookController < DataManager
  def initialize
    super('book')
  end
end
