require 'rails_helper'

describe YelpScraper do
  describe '#perform' do
    let(:search_results) { [double('element alpha'), double('element bravo')] }

    it 'calls #create_business for each element returned by #search_results' do
      expect(subject).to receive(:search_results).and_return(search_results)
      expect(subject).to receive(:create_business).with(search_results[0])
      expect(subject).to receive(:create_business).with(search_results[1])
      subject.perform
    end
  end

  describe '#create_business' do
    let(:element) do
      VCR.use_cassette('yelp', record: :new_episodes) do
        subject.search_results.first
      end
    end

    it 'creates a yelp business' do
      expect {
        subject.create_business(element)
      }.to change(Business, :count).by(1)
    end

    it 'assigns the correct attributes' do
      business = subject.create_business(element)
      expect(business.name).to eq 'Myriad Gastro Pub'
      expect(business.url).to eq 'http://www.yelp.com/biz/myriad-gastro-pub-san-francisco'
      expect(business.address).to eq '2491 Mission St San Francisco, CA 94110'
      expect(business.rating).to eq '4.5'
    end
  end

  describe '#seach_results' do
    it 'fetches the first ten new yelp businesses' do
      VCR.use_cassette('yelp', record: :new_episodes) do
        expect(subject.search_results.length).to eq 10
      end
    end

    it 'returns an array of nokogiri elements' do
      VCR.use_cassette('yelp', record: :new_episodes) do
        expect(subject.search_results.first).to be_a(Nokogiri::XML::Element)
      end
    end
  end
end
