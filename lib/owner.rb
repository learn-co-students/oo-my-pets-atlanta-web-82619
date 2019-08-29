class Owner
  attr_reader :name , :species
  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
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
    @@all.clear
  end

  def pets 
    cats = Cat.all.select {|cat| cat.owner == self}
    dogs = Dog.all.select {|dog| dog.owner == self}
    (cats << dogs).flatten!
  end 

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    self.pets.each {|pet| pet.mood = 'nervous'}
    self.pets.each {|pet| pet.owner = nil}
  end

  def list_pets
    dogs = self.dogs.count
    cats = self.cats.count
    "I have #{dogs} dog(s), and #{cats} cat(s)."
  end
end