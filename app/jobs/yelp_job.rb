class YelpJob < ActiveJob::Base
  queue_as :default

  def perform(url)
    YelpScraper.new(url).perform
  end
end
