require 'rails_helper'

RSpec.describe 'Markets' do
  describe 'find favorites by id' do
    it 'hits the endpoint' do 
      query_params = {
        market_ids: [3, 7, 25, 680]
      }
      
      get api_v1_markets_favorites_path, params: query_params

      expect(response).to be_successful
    end

    it 'returns the correct json objects' do 
      query_params = {
        market_ids: [3, 7, 25, 680]
      }

      get api_v1_markets_favorites_path, params: query_params

      markets = JSON.parse(response.body, symbolize_names: true)[:data]
      require 'pry'; binding.pry
      markets.each do |market|
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a(String)
        
        expect(market[:attributes]).to have_key(:address)
        expect(market[:attributes][:address]).to be_a(String)

        expect(market[:attributes]).to have_key(:site)
        expect(market[:attributes][:site]).to be_a(String)

        expect(market[:attributes]).to have_key(:description)
        expect(market[:attributes][:description]).to be_a(String)

        expect(market[:attributes]).to have_key(:fnap)
        expect(market[:attributes][:fnap]).to be_a(String)

        expect(market[:attributes]).to have_key(:snap_option)
        expect(market[:attributes][:snap_option]).to be_a(String)

        expect(market[:attributes]).to have_key(:accepted_payment)
        expect(market[:attributes][:accepted_payment]).to be_a(String)

        expect(market[:attributes]).to have_key(:longitude)
        expect(market[:attributes][:longitude]).to be_an(Float)

        expect(market[:attributes]).to have_key(:latitude)
        expect(market[:attributes][:latitude]).to be_an(Float)
      end

      market_ids = markets.map { |market| market[:attributes][:id] }

      expect(markets.count == 4).to be true
      expect(market_ids).to include('3')
      expect(market_ids).to include('7')
      expect(market_ids).to include('25')
      expect(market_ids).to include('680')
    end
  end
end
