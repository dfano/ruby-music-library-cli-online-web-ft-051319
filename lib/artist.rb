class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    obj = new(name)
    obj.save
    obj
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song) #unless the song is already in the songs array
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end


end
