class Owner
  attr_reader :name, :species

  @@all = []
  # code goes here
  def initialize (name)
    @name = name
    @species = 'human'
    @@all.push(self)
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end 

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    (self.dogs + self.cats).each do |pet| 
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end
end