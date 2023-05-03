require_relative '../helpers/data_manager'
class AuthorController < DataManager
  def initialize
    super('author')
  end
end
