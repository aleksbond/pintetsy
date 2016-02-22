require 'rails_helper'

RSpec.describe Listing do
  let(:pin) { Hashie::Mash.new }

  describe "#initialize" do
    it "Retreives Etsy listing from Pin note" do
      pin[:note] = "Etsy listing at https://www.etsy.com/pt/listing/123456789/necklace-foliage" 
      expect(Etsy::Listing).to receive(:find).with(123456789)
      described_class.new(pin)
    end
  end
end
