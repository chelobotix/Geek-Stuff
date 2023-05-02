require_relative '../helpers/data_manager'
class MusicController < DataManager
  def initialize
    super('music')
  end
end