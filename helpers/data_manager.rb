require_relative 'file_manager'
class DataManager
  def initialize(file_name)
    @file_storage = FileManager.new(file_name)
  end

  def save(data)
    data.each { |info| @file_storage.writer(info) }
  end

  def list
    @file_storage.reader
  end
end
