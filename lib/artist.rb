require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def find_all_songs_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist #self
    end
  end

  def songs
    find_all_songs_by_artist(self)
  end

  def add_song(song)
    song.artist = self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_artist_by_name(name)
    self.all.find do |one_artist|
      one_artist.name == name
    end
  end

  def self.find_or_create_by_name(name)
    artist = find_artist_by_name(name)
    artist ? artist : Artist.new(name)
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  # def add_song_by_name(name)
  #   song = Song.new(name)
  #   song.artist = self
  # end

end


# class Artist
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def songs
#     # Song.all.select do |song|
#     #   binding.pry
#     # end
#   end
#
#   def add_song(song)
#
#   end
# end
