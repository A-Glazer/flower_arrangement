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

  def self.create(name, price, url)
    flower = self.new(name, price, url) if find_by_name(name).nil?
  end

  def self.find_by_name(name)
    @@all.find { |flower| flower.name == name }
  end

end