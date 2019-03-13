require_relative 'version.rb'
require 'nokogiri'
require_relative 'flower.rb'

class Scraper
  
  def self.scrape_website
    website = Nokogiri::HTML(open("https://modernflorist.com/"))
    section = website.css("div.products-grid-wrapper")
    
    @@flowers = section.css("li")
    @@flowers.collect do |flower|
      capname = []
      name = flower.css("span.product_title").text 
      words = name.split(" ")
      words.collect do |word|
        letters = word.split("")
        letters.first.upcase!
        capital = letters.join
        capname << capital
      end
      name = capname.join(" ")


      price = flower.css("span.price").text
      url = flower.css("a.more-link").attr("href").value
               
      object = Flower.create(name,price,url)
    end
    
  end 
 
  
end
