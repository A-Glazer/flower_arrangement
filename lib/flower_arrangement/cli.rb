require_relative 'version.rb' #remove before saving final project


class CLI
    @@low = []
    @@med = []
    @@high = [] 

  def call
    scraper_categories
    greeting
    user_input_greeting
    # see_more
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
      low = @@low.uniq
      low.each do |flower|
        puts "Name: #{flower.name}, Price: #{flower.price}, Link: #{flower.url}" 
      end
      binding.pry
    elsif input == 2 
      med = @@med.uniq
      med.each do |flower|
        puts "Name: #{flower.name}, Price: #{flower.price} Link: #{flower.url}"
      end
    elsif input == 3 
      high = @@high.uniq
      high.each do |flower|
        puts "Name: #{flower.name}, Price: #{flower.price} Link: #{flower.url}"
      end
    elsif input == "exit" || input == "main menu"
        goodbye
    else
      puts "Invalid request, please choose a price range."
    end 
  end
  
  def scraper_categories
    scraped = Scraper.scrape_website
    flowers = Flower.all 
    flowers.each do |flower| 
      number = flower.price.gsub("$","").to_i
      if number >= 150.00
        @@high |= [flower]
     
      elsif number < 80.00 && number > 0.00
        @@low << flower unless @@low.include?(flower)
      elsif number > 80.00 && number < 150.00
        @@med << flower unless @@med.include?(flower)
      end
    end
  end


 
  #  def see_more
  #   input = gets.strip
  #     self.all.find(input)
  #       puts input.url
  #     end
  # end

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

