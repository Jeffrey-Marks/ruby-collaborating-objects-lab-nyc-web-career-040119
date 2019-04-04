require 'pry'

class MP3Importer
  attr_accessor :path, :files
  # attr_reader :files

  def initialize(path)
    @path = path
    @files = []
    Dir.foreach(self.path) do |item|
      next if item == '.' or item == '..'
      self.files << item
    end
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
