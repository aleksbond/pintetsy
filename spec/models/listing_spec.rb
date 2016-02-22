require 'rails_helper'

RSpec.describe Listing do
  let(:pin) { Hashie::Mash.new }
  let(:etsy_listing) { Etsy::Listing.new }
  let(:user) { Etsy::User.new }

  describe "#initialize" do
    it "Retreives Etsy listing from Pin note" do
      pin[:note] = "Etsy listing at https://www.etsy.com/pt/listing/123456789/necklace-foliage" 
      allow(etsy_listing).to receive_message_chain(:user_id, :nil?).and_return(false)
      allow(user).to receive(:result)
      expect(Etsy::Listing).to receive(:find).with(123456789).and_return(etsy_listing)
      expect(Etsy::User).to receive(:find).and_return(user)
      described_class.new(pin)
    end
  end
end
