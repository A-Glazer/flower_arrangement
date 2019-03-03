require_relative 'version.rb'
class FlowerArrangement::FlowerScraper
  # attr_accessor :name, :price, :url => move to flower.rb
  
  # need to initialize a flower object (name, price, url)
  # @name = name
  
  def self.scrape_main_website
    doc = Nokogiri::HTML(open("https://modernflorist.com/"))
    name = doc.css("a.hover-info span.product_title")
      name.collect{|title| title.text}
      
    price = doc.css("a.hover-info span.price").text.split("$")
      price.collect {|amount| "${amount}"}.shift
      
    url = doc.css("a.more-link").attr("href").value
    binding.pry
      
      
  end
  
end

#doc =>
#step 1. scrape everything
#step 2. create flower.rb file and class FlowerArrangement::Flower
#     in flower class initialize with name, price, url
# (initialize is ready to accept orders)

# [array 123924394 @name = FlowerArrangement::Flower.new(name, price, url), @url = url, @price = price]
#CLI will call on the scraper and will pass in the name, price and url argument
