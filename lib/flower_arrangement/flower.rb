require_relative 'version.rb'

class Flower
    attr_accessor :name, :price, :url
    @@all = []


  def initialize(name,price,url)
    @name = name
    @price = price
    @url = url    
    
    @@all << self
  end

  def self.all
      @@all
  end

  def self.clear
    @@all.clear 
  end

  def save 
    @@all << self
  end

  



end