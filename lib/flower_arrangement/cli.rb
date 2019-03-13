require_relative 'version.rb' #remove before saving final project


class CLI
    @@low = []
    @@med = []
    @@high = [] 

  def call_beg
    scraper_categories
    greeting
    user_input_greeting
    see_more
    goodbye
  end

  
  def call
    greeting
    user_input_greeting
    see_more
    goodbye
  end
  
  def greeting
    puts "Welcome to Modern Florist, please enter a number refering to a price range from the choices below:"
    puts "1. $45 - $79"
    puts "2. $80 - $149"
    puts "3. $150 and up"
  end

  def user_input_greeting
    input = gets.strip.to_i    
    if input == 1 
      low = @@low
      low.collect do |flower|
        puts "Name: #{flower.name}" 
      end
      # binding.pry
    elsif input == 2 
      med = @@med
      med.collect do |flower|
        puts "Name: #{flower.name}"
      end
    elsif input == 3 
      high = @@high
      high.uniq.collect do |flower|
        puts "Name: #{flower.name}"
      end
    elsif input == "exit" || input == "main menu"
        goodbye
    else
      puts "Invalid request, please choose a price range."
    end 
  end
  
  def scraper_categories
    scraped = Scraper.scrape_website
    # flowers = Flower.all 
    scraped.each do |flower| 
      number = flower.price.gsub("$","").to_i
      # binding.pry
      if number >= 150.00
        @@high << flower
      elsif number < 80.00 && number > 0.00
        @@low << flower 
      elsif number > 80.00 && number < 150.00
        @@med << flower
      end
    end
  end


 
  def see_more
    puts "Would you like to see more information about a specific flower? Please type in the flower name as it appears above."
    input = gets.strip
    if flower = Flower.find_by_name(input)
       puts "Name: #{flower.name}  *  Price: #{flower.price}  *  Link: #{flower.url}"
    else
      puts "Invalid entry. Please type the flower name."
      see_more   
    end
  end

  def goodbye
    puts "Thank you for shopping. Please type in main menu or exit."
  
    input = gets.strip
      if input == "main menu"
        call
      elsif input == "exit"
        puts "Goodbye"
      else 
        puts "Invalid entry. Please type either main menu or exit."
      end
  end

  
end

