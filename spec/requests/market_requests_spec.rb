require 'rails_helper'

RSpec.describe 'Market Microservice API Request' do
  describe 'market requests' do
    it 'can get all markets', :vcr do
      query_params = {latitude: 30.69035, longitude: -88.045015, radius: 50}
      get api_v1_markets_path, params: query_params
      data = JSON.parse(response.body, symbolize_names: true)[:data]
      @markets = data.map { |market| Market.new(market[:attributes]) }

      expect(@markets).to be_a(Array)
      expect(@markets.count).to eq(154)

      @markets.each do |market|
        expect(market).to be_a Market
        expect(market.name).to be_a(String)
        expect(market.address).to be_a(String)
        expect(market.longitude).to be_a(Float)
        expect(market.latitude).to be_a(Float)
      end
    end


    it 'gets one market', :vcr do
      get api_v1_market_path(2)
      data = JSON.parse(response.body, symbolize_names: true)[:data]
      @market = Market.new(data[:attributes])

      expect(@market).to be_a Market
      expect(@market.name).to eq("Market in The Park")
      expect(@market.address).to eq("300 Conti, Mobile, Alabama 36602")
      expect(@market.site).to eq("Local government building grounds;")
      expect(@market.description).to eq("Cathedral Square, located in downtown Mobile, bordered by Conti, Jackson, Dauphin, and Claiborne Streets.")
      expect(@market.fnap).to eq("Senior Farmers Market Nutrition Program;")
      expect(@market.snap_option).to eq(nil)
      expect(@market.accepted_payment).to eq("Debit card/Credit card;")
      expect(@market.longitude).to eq(-88.045015)
      expect(@market.latitude).to eq(30.69035)
    end

    it 'hits the endpoint for market favorites', :VCR do
      query_params = {
        market_ids: [3, 7, 25, 680]
      }
      get api_v1_favorites_path, params: query_params
      expect(response).to be_successful
    end

    it 'returns the correct json objects for market favorites query', :vcr do
      query_params = {
        market_ids: [3, 7, 25, 680]
      }
      get api_v1_favorites_path, params: query_params
      markets = JSON.parse(response.body, symbolize_names: true)[:data]

      markets.each do |market|
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes]).to have_key(:address)
        expect(market[:attributes]).to have_key(:site)
        expect(market[:attributes]).to have_key(:description)
        expect(market[:attributes]).to have_key(:fnap)
        expect(market[:attributes]).to have_key(:snap_option)
        expect(market[:attributes]).to have_key(:accepted_payment)
        expect(market[:attributes]).to have_key(:longitude)
        expect(market[:attributes]).to have_key(:latitude)
      end

      market_ids = markets.map { |market| market[:id] }
      expect(markets.count == 4).to be true
      expect(market_ids).to include('3')
      expect(market_ids).to include('7')
      expect(market_ids).to include('25')
      expect(market_ids).to include('680')
    end
  end
end