require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  include Memorable::InstanceMethods
  def initialize
    super
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end
  
  extend Memorable::ClassMethods

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  include Paramable
end
