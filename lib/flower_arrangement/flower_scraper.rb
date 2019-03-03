require_relative 'version.rb'

class FlowerArrangement::FlowerScraper
  attr_accessor :name, :price, :url 
  @@flower_array = []

  def self.flower_array
    
    flower_array << self.scrape_main_website
    binding.pry
  end
  
  
  
  def self.scrape_main_website
    doc = Nokogiri::HTML(open("https://modernflorist.com/"))
    
    i =  1
    while i < 16
      
    flower = self.new
    flower.name = doc.css("a.hover-info span.product_title")[0].text
    flower.price = doc.css("a.hover-info span.price")[0].text
    flower.url = doc.css("a.more-link").attr("href").value
    i += 1 
  end 
  @@flower_array
    binding.pry

  end
  
end

