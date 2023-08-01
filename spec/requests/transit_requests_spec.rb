require 'rails_helper'

RSpec.describe 'Transit Route Requests' do
  describe 'Find transit routes' do
    it 'finds routes between two locations' do
      query_params = { 
        original_lat: 40.77709768562554,
        original_lon: -73.87400881765025,
        destination_lat: 40.748594902847515,
        destination_lon: -73.98564294463469
      }
      get api_v1_market_transit_routes_path(2), params: query_params
      route_data = JSON.parse(response.body, symbolize_names: true)[:plan][:itineraries]
      legs_data = route_data.map do |r|
        r[:legs]
      end
      leg_info = legs_data.first.select do |leg|
        leg[:agencyName].nil? == false
      end
      @routes = leg_info.map do |leg|
        TransitRoute.new(leg)
      end
      
      expect(@routes).to be_an Array
      expect(@routes.count).to eq 2
      expect(@routes.first).to be_an TransitRoute
      expect(@routes.first.agency_name).to eq "MTA Bus Company"
      expect(@routes.first.route_short_name).to eq "Q70-SBS"
      expect(@routes.second.agency_name).to eq "MTA New York City Transit"
      expect(@routes.second.route_short_name).to eq "F"
    end
  end
end