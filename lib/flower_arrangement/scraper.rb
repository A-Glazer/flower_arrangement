require_relative 'version.rb'

class Scraper
  
  def self.scrape_website
    website = Nokogiri::HTML(open("https://modernflorist.com/"))
    section = website.css("div.products-grid-wrapper")
    
    flowers = section.css("li")
    
    flowers.each do |flower|
         
      name = flower.css("a.hover-info span.product_title").text
      price = flower.css("a.hover-info span.price").text
      url = flower.css("a.more-link").attr("href").value

      Flower.new(name,price,url)
      binding.pry
    end
  end 
 
  
end

