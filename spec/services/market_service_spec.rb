require 'rails_helper'

RSpec.describe MarketService do
  it 'can create a connection and consume API' do
    json_response = File.read('spec/fixtures/market_search.json')
    stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/api/v1/markets/search?latitude=30.69035&longitude=-88.045015&radius=50").
      to_return(status: 200, body: json_response)
    markets = JSON.parse(json_response, symbolize_names: true)[:data]
    expect(markets).to be_a(Array)
    expect(markets.count).to eq(22)
    expect(markets.first).to be_a(Hash)
    expect(markets.first[:attributes][:name]).to eq("Market in The Park")
    expect(markets.second[:attributes][:name]).to eq("Market in The Park - Lavretta Park")
  end
end