class YelpScraper

  attr_reader :yelp_url

  def initialize(yelp_url = nil)
    @yelp_url = yelp_url || 'http://www.yelp.com/search?attrs=NewBusiness&cflt=restaurants&find_desc=&find_loc=San+Francisco%2C+CA'
  end

  def perform
    search_results.each do |element|
      create_business(element)
    end
  end

  def search_results
    @search_results ||= begin
      parser = Mechanize.start { |agent| agent.get(yelp_url).parser }
      parser.css('.regular-search-result')
    end
  end

  # @return [Business]
  def create_business(element)
    business = Business.new
    business.name = element.css('.biz-name').text
    business.url = "http://www.yelp.com#{element.css('.biz-name').attr('href')}"
    business.address = element.css('address').inner_html.sub(/<br>/, ' ').strip
    business.rating = element.css('.star-img').attr('title').to_s[/([\d\.]+)/, 1]
    business.save
    business
  end
end
