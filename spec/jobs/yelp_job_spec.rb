require 'rails_helper'

describe YelpJob, type: :job do
  describe '#perform' do
    it 'calls the #perform method of the YelpScraper' do
      expect_any_instance_of(YelpScraper).to receive(:perform)
      YelpJob.perform_now
    end
  end
end
