require 'rails_helper'

RSpec.describe MarketSearch, type: :model do
  before :each do
    @market_search = MarketSearch.new
  end

  describe '#all_markets', :vcr do
    it 'returns all markets' do
      latitude, longitude, radius = [30.2672, -97.7431, 50] # Replace these values as needed
      markets = @market_search.all_markets(latitude, longitude, radius)

      expect(markets).to be_a(Array)
      expect(markets.first).to be_a(Market)
    end
  end

  describe '#one_market', :vcr do
    it 'returns a single market' do
      market_id = 1 
      market = @market_search.one_market(market_id)

      expect(market).to be_a(Market)
    end
  end

  describe '#favorite_markets', :vcr do
    it 'returns favorite markets' do
      market_ids = [1, 2, 3]
      markets = @market_search.favorite_markets(market_ids)

      expect(markets).to be_a(Array)
      expect(markets.first).to be_a(Market)
    end
  end
end
