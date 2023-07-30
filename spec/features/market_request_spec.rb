require 'rails_helper'

RSpec.describe 'Market Microservice API Request', type: :feature do
  describe 'market requests' do
    it 'can get all markets' do
      json_response = File.read('spec/fixtures/market_search.json')
      stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/api/v1/markets/search?latitude=30.69035&longitude=-88.045015&radius=50").
        to_return(status: 200, body: json_response)
      @markets = JSON.parse(json_response, symbolize_names: true)[:data]

      expect(@markets).to be_a(Array)
      expect(@markets.count).to eq(22)
      expect(@markets.first).to be_a(Hash)
      expect(@markets.first[:attributes][:name]).to eq("Market in The Park")
      expect(@markets.second[:attributes][:name]).to eq("Market in The Park - Lavretta Park")
    end

    it 'gets one market' do
      json_response = File.read('spec/fixtures/one_market_search.json')
      stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/api/v1/markets/search?2").
        to_return(status: 200, body: json_response)
      @market = JSON.parse(json_response, symbolize_names: true)[:data].first

      expect(@market).to be_a(Hash)
      expect(@market[:id]).to eq(2)
      expect(@market[:attributes][:name]).to eq("Market in The Park")
      expect(@market[:attributes][:address]).to eq("300 Conti, Mobile, Alabama 36602")
      expect(@market[:attributes][:site]).to eq("Local government building grounds;")
      expect(@market[:attributes][:description]).to eq("Cathedral Square, located in downtown Mobile, bordered by Conti, Jackson, Dauphin, and Claiborne Streets.")
      expect(@market[:attributes][:fnap]).to eq("Senior Farmers Market Nutrition Program;")
      expect(@market[:attributes][:snap_option]).to eq(nil)
      expect(@market[:attributes][:accepted_payment]).to eq("Debit card/Credit card;")
      expect(@market[:attributes][:longitude]).to eq(-88.045015)
      expect(@market[:attributes][:latitude]).to eq(30.69035)
    end
  end
end