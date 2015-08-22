require 'rails_helper'

describe YelpScraper do
  describe '#perform' do
    it 'fetches the yelp page' do
      VCR.use_cassette('yelp') do
        expect(subject.perform).to be_truthy
      end
    end
  end
end
