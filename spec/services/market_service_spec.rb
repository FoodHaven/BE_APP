require 'rails_helper'

RSpec.describe MarketService do
  it 'can create a connection and consume API' do
    json_response = File.read('spec/fixtures/market_search.json')
    stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/api/v1/markets").
      to_return(status: 200, body: json_response)
    markets = JSON.parse(json_response, symbolize_names: true)[:data]

    expect(markets).to be_a(Array)
    expect(markets.count).to eq(2)
    expect(markets.first).to be_a(Hash)
    expect(markets.first[:name]).to eq("Lakewood Hood's Goods")
    expect(markets.second[:name]).to eq("Brownville Bakeoff")
  end
end