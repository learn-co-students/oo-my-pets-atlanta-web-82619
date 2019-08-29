class Cat
  # code goes here

  @@all = []

  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner)
    @owner = owner
    @name = name
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end
end