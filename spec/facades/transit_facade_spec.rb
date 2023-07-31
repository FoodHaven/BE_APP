require 'rails_helper'

RSpec.describe 'Transit Facade' do
  describe 'class methods' do
    it 'returns a list of transit routes' do
      json_response = File.read('spec/fixtures/transit_routes/transit_search.json')
      stub_request(:get, "TransitFacade.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @routes = data[:plan][:itineraries]

      expect(@routes).to be_an Array
      expect(@routes.count).to eq 3
      @routes.each do |route|
        expect(route[:legs]).to be_an Array
        expect(route[:legs].second).to have_key :agencyName
        expect(route[:legs].second).to have_key :startTime
        expect(route[:legs].second).to have_key :endTime
        expect(route[:legs].second).to have_key :headsign
        expect(route[:legs].second).to have_key :routeShortName
      end
    end
  end
end