require_relative 'version.rb' #remove before saving final project
# FlowerArrangement::FlowerScraper.scrape_main_website #test with bin/controller - running like user
class CLI
  attr_accessor :name, :price, :url

  def initialize
    @name = name
    @price = price
    @url = url
  end
  
  
  def call
    greeting
    
  end
  
  def greeting
    puts "Welcome to Modern Florist, please enter a price range from the choices below:"
    puts "1. $45 - $79"
    puts "2. $80 - $149"
    puts "3. $150 and up"
  end

  # def user_input_greeting
  #   input = gets.strip
    
  #   if input == "1"
  #     puts "name"
      
  #   end 
    
  # end
  
  def scraper_categories
    scraped = Scraper.scrape_main_website
    # scraped.price
    binding.pry
  end
  
end

