require 'rails_helper'

RSpec.describe 'Market Service' do
  describe 'favorites' do 
    it 'can create a connection and consume API' do
      @markets = MarketService.new.all_markets(30.69035, -88.045015, 50)[:data]

      expect(@markets).to be_a(Array)
      expect(@markets.count).to eq(12)
      expect(@markets.first).to be_a(Hash)
      expect(@markets.first[:id]).to eq "2"
      expect(@markets.first[:attributes][:name]).to eq("Market in The Park")
      expect(@markets.second[:id]).to eq "12"
      expect(@markets.second[:attributes][:name]).to eq("Market in The Park - Lavretta Park")
    end

    it 'can retrieve one market from market service' do
      @market = MarketService.new.one_market(2)
      @market_hash = @market[:data]
      
      expect(@market).to be_a Hash
      expect(@market.count).to eq 1
      expect(@market_hash).to be_a Hash
      expect(@market_hash[:id]).to be_a String
      expect(@market_hash[:id]).to eq "2"
      expect(@market_hash[:attributes]).to be_a Hash
      expect(@market_hash[:attributes]).to have_key :name
      expect(@market_hash[:attributes]).to have_key :address
      expect(@market_hash[:attributes]).to have_key :site
      expect(@market_hash[:attributes]).to have_key :description
      expect(@market_hash[:attributes]).to have_key :fnap
      expect(@market_hash[:attributes]).to have_key :snap_option
      expect(@market_hash[:attributes]).to have_key :accepted_payment
      expect(@market_hash[:attributes]).to have_key :longitude
      expect(@market_hash[:attributes]).to have_key :latitude
    end

    it 'can retrieve favorites from market service' do 
      @ms = MarketService.new
      ids = [12, 34, 56]

      markets = @ms.favorite_markets(ids)[:data]
      market_ids = markets.map { |market| market[:id] }

      expect(markets.count == 3).to be true
      expect(market_ids).to include('12')
      expect(market_ids).to include('34')
      expect(market_ids).to include('56')
    end
  end
end