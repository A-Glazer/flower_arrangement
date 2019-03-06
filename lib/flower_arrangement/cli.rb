require_relative 'version.rb' #remove before saving final project

class CLI
  @@low = []
  @@med = []
  @@high = [] 


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
  #     puts @@low
  #   elsif input == "2"
  #     puts @@med
  #   elsif input == "3"
  #     puts @@high
  #   end 
    
  # end
  
  def scraper_categories
    scraped = Scraper.scrape_website
    Flower.all 
    #find method?
    # if price == $0..$79
      # @@low << flower_object
    # elsif == $80..$149
      # @@med << flower_object
    # else
      # @@high << flower_object
    # end 

    # binding.pry
  end
  
end

