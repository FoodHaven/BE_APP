require 'rails_helper'

RSpec.describe Market, type: :model do
  describe 'create market object' do
    it 'has market attributes' do
      market = Market.new("Lakewood Hood's Goods", "1234 S. Colorado and Colorado, Denver Colorado", "behind king soopers", "Hood's Goods is a local market that sells fresh produce and other goods.", true, true, true, 39.7392, -104.9903)

      expect(market).to be_a(Market)
      expect(market.name).to eq("Lakewood Hood's Goods")
      expect(market.address).to eq("1234 S. Colorado and Colorado, Denver Colorado")
      expect(market.site).to eq("behind king soopers")
      expect(market.description).to eq("Hood's Goods is a local market that sells fresh produce and other goods.")
      expect(market.fnap).to eq(true)
      expect(market.snap_option).to eq(true)
      expect(market.accepted_payment).to eq(true)
      expect(market.longitude).to eq(39.7392)
      expect(market.latitude).to eq(-104.9903)
    end
  end
end