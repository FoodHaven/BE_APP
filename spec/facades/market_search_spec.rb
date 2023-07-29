require 'rails_helper'

RSpec.describe 'Market Search Facade' do
  describe 'class methods' do
    it 'returns a list of markets' do
      json_response = File.read('spec/fixtures/market_search.json')
      stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/api/v1/markets/search?latitude=30.69035&longitude=-88.045015&radius=50").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)[:data]      
      @markets = MarketSearch.new.all_markets(30.69035, -88.045015, 50)

      expect(@markets).to be_an(Array)
      expect(@markets.count).to eq(22)
      expect(@markets.first).to be_a(Market)
      expect(@markets.first.name).to eq(data.first[:attributes][:name])
      expect(@markets.second.name).to eq(data.second[:attributes][:name])
    end
  end
end