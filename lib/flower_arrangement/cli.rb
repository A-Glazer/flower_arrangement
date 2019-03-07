require_relative 'version.rb' #remove before saving final project


class CLI
    @@low = []
    @@med = []
    @@high = [] 
# testing 123

  def call
    scraper_categories
    greeting
    user_input_greeting
    see_more
    goodbye
  
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


  # def user_input_greeting
  #   input = gets.strip
    
  #   if input == "1" || "$45 - $79"
  #     puts @@low
  #     puts "Do you want to see more information about a particular flower? Please type in the flower name."
  #   elsif input == "2" || "$80 - $149"
  #     puts @@med
  #     puts "Do you want to see more information about a particular flower? Please type in the flower name."
  #   elsif input == "3" || "$150 and up"
  #     puts @@high
  #     puts "Do you want to see more information about a particular flower? Please type in the flower name."
  #   elsif input == "exit"
  #     puts "Thank you for shopping. Hope to see you again soon!"
  #   else
  #     puts "invalid request, please choose a price range"
  #   end 
    
  # end
  
  #  def see_more
  #   input = gets.strip
  #     self.all.find(input)
  #       puts input.url
  #     end
  # end

  # def goodbye
  #   puts "Thank you for shopping. Please type in "main menu" or "exit"."
  #   input = gets.strip
  #     if input == "main menu"
  #       call
  #     elsif input == "exit"
  #       puts "Goodbye"
  #     else 
  #       puts "Invalid entry. Please type either "main menu" or "exit"."

  # end

  
end

