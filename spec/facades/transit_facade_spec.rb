require 'rails_helper'

RSpec.describe 'Transit Facade' do
  describe 'class methods' do
    it 'returns a list of transit routes' do
      json_response = File.read('spec/fixtures/transit_search.json')
      stub_request(:get, "https://external.transitapp.com/v3/otp/plan?fromPlace=40.77709768562554,-73.87400881765025&toPlace=40.748594902847515,-73.98564294463469").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @routes = TransitFacade.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)

      expect(@routes).to be_an(Array)
      expect(@routes.count).to eq(5)
      expect(@routes.second.agency_name).to eq("MTA Bus Company")
      expect(@routes.second.route_short_name).to eq("Q70-SBS")
      expect(@routes.fourth.agency_name).to eq("MTA New York City Transit")
      expect(@routes.fourth.route_short_name).to eq("F")
    end
  end
end