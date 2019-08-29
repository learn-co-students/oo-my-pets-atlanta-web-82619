require 'pry'
class Owner
attr_reader :name, :species
 @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |c| c.owner == self }
  end

  def dogs
    Dog.all.select { |d| d.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each { |d| d.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |c| c.mood = "happy" }
  end

  def sell_pets
    all_pets = self.dogs + self.cats
    all_pets.each { |d| d.mood = "nervous" and d.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end