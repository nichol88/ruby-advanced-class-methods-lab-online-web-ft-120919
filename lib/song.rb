class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = Song.new
    @@all << s
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = Song.new
    s.name = name
    @@all << s
    s
  end

  def self.find_by_name(name)
    self.all.filter{|e| e.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    # check is @@all has a song with this name
    return self.create_by_name(name) if !self.find_by_name(name)
    self.find_by_name(name)
  end

end
