require_relative 'version.rb'

class FlowerArrangement::FlowerScraper
  attr_accessor :name, :price, :url 
  @@flower_array = []


  def self.all
    @@flower_array
  end
  
  
  def self.scrape_main_website
    doc = Nokogiri::HTML(open("https://modernflorist.com/"))
    
    i = 0
    while i < 15
      
    flower = self.new
    flower.name = doc.css("a.hover-info span.product_title")[i].text
    flower.price = doc.css("a.hover-info span.price")[i].text
    flower.url = doc.css("a.more-link")[i].attr("href")
    @@flower_array << flower
    i += 1 
  end 
  @@flower_array 
  end
  
end

