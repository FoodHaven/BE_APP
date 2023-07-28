require 'rails_helper'

RSpec.describe 'Market Search Facade' do
  describe 'class methods' do
    it 'returns a list of markets' do
      json_response = File.read('spec/fixtures/market_search.json')
      stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/api/v1/markets").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)[:data]      
      @markets = MarketSearch.new.all_markets

      expect(@markets).to be_an(Array)
      expect(@markets.count).to eq(2)
      expect(@markets.first).to be_a(Market)
      expect(@markets.first.name).to eq(data.first[:name])
      expect(@markets.second.name).to eq(data.second[:name])
    end
  end
end