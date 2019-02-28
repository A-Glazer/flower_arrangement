require_relative 'version.rb'
class FlowerArrangement::FlowerScraper
  attr_accessor :name, :price, :url
  
  
  def self.scrape_main_website
    doc = Nokogiri::HTML(open("https://modernflorist.com/"))
    name = doc.css("a.hover-info span.product_title")
      name.each do |title|
        title.text
    binding.pry
      end
  end
  

  
  
end

