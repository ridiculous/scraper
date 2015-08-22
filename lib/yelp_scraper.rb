class YelpScraper
  def perform
    yelp_url = 'http://www.yelp.com/search?attrs=NewBusiness&cflt=restaurants&find_desc=&find_loc=San+Francisco%2C+CA'
    page = nil
    Mechanize.start do |agent|
      page = agent.get(yelp_url)
    end
    page
  end
end
