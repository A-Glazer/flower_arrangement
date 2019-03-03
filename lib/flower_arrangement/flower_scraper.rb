require_relative 'version.rb'

class FlowerArrangement::FlowerScraper
  attr_accessor :name, :price, :url 
  @@all = []


  def initialize(name, price, url)
    @name = name 
    @price = price 
    @url = url
    @@all << self
  end 
  
  
  def self.all 
    @@all  
  end 
  
  
  
  def self.scrape_main_website
    doc = Nokogiri::HTML(open("https://modernflorist.com/"))
    
    name = doc.css("a.hover-info span.product_title")[0].text
      # name.collect{|title| title.text}
      
    price = doc.css("a.hover-info span.price").text.split("$")
      price.collect {|amount| "${amount}"}.shift
      
    url = doc.css("a.more-link").attr("href").value
    
    flower = self.new(name, price, url) 
    
    @@all << flower
    binding.pry

  end
  
end

