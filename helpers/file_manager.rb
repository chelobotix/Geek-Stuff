require 'json'
require 'fileutils'
class FileManager
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def reader
    path = File.join(__dir__, '../storage', "#{@filename}.json")
    return [] unless File.exist?(path)

    data = JSON.parse(File.read(path))
    data.is_a?(Array) ? data : []
  end

  def writer(new_data)
    path = File.join(__dir__, '../storage', "#{@filename}.json")

    FileUtils.mkdir_p('storage')

    data = data_joinner(new_data)

    File.write(path, JSON.pretty_generate(data))
    puts "#{@filename.capitalize} saved successfully!"
  end

  private

  def data_joinner(new_data)
    old_data = reader || []
    (old_data << new_data) || []
  end
end
