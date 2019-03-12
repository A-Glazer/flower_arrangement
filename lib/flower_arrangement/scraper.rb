require_relative 'version.rb'
require 'nokogiri'
require_relative 'flower.rb'

class Scraper
  
  def self.scrape_website
    website = Nokogiri::HTML(open("https://modernflorist.com/"))
    section = website.css("div.products-grid-wrapper")
    
    @@flowers = section.css("li")
    @@flowers.collect do |flower|
         #capitalize name in this method
      name = flower.css("span.product_title").text 
      test = "testing This is lowercase"
      test.split(" ").collect do |word|
        letters = word.split("")
        letters.first.upcase!
        letters.join

  
      end.join(" ")
      price = flower.css("span.price").text
      url = flower.css("a.more-link").attr("href").value
               
      object = Flower.create(name,price,url)
    end
    
  end 
 
  
end
