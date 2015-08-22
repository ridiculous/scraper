class YelpJob < ActiveJob::Base
  queue_as :default

  def perform
    YelpScraper.new.perform
  end
end
