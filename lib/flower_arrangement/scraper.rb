require_relative 'version.rb'
require 'nokogiri'

class Scraper
  
  def self.scrape_website
    website = Nokogiri::HTML(open("https://modernflorist.com/"))
    section = website.css("div.products-grid-wrapper")
    
    flowers = section.css("li")
    
    flowers.each do |flower|
         
      name = flower.css("span.product_title").text
      price = flower.css("span.price").text
      url = flower.css("a.more-link").attr("href").value
       
      FlowerArrangement::Flower.new(name,price,url)
      binding.pry
    end
    
  end 
 
  
end
Scraper.scrape_website
