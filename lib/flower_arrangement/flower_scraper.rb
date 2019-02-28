class FlowerArrangement::FlowerScraper
  attr_accessor :name, :price, :url
  
  
  def self.scrape_main_website
    doc = Nokogiri::HTML(open("https://modernflorist.com/"))
    # binding.pry
    
  end
  
    # def self.scrape_woot
    # doc = Nokogiri::HTML(open("https://woot.com"))

    # deal = self.new
    # deal.name = doc.search("h2.main-title").text.strip
    # deal.price = doc.search("#todays-deal span.price").text.strip
    # deal.url = doc.search("a.wantone").first.attr("href").strip
    # deal.availability = true

    # deal
  # end
  
  
end

# FlowerScraper.scrape_main_website