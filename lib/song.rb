require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def self.new_by_filename(filename)
    filename = filename.split(/[-]/)
    artist_name = filename[0].strip
    song_name = filename[1].strip

    song = Song.new(song_name)

    # song.artist = Artist.find_artist_by_name(artist_name)
    if Artist.find_artist_by_name(artist_name)
      song.artist = Artist.find_artist_by_name(artist_name)
    else
      new_artist = Artist.new(artist_name)
      new_artist.save
      song.artist = new_artist
      # binding.pry
    end
    song
  end
end


# class Song
#   attr_accessor :name, :artist
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
# end
