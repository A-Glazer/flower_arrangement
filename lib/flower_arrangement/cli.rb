require_relative 'version.rb' #remove before saving final project
class FlowerArrangement::CLI

  def call
    puts "Testing 123"
    FlowerArrangement::FlowerScraper.scrape_main_website #test with bin/controller - running like user
  end

end

