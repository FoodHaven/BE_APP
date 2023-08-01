require 'rails_helper'

RSpec.describe 'Transit Route Requests' do
  describe 'Find transit routes' do
    it 'finds routes between two locations', :vcr do
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
      expect(@routes.first.agency_name).to be_a String
      expect(@routes.first.route_short_name).to be_a String
      expect(@routes.second.agency_name).to be_a String
      expect(@routes.second.route_short_name).to be_a String
    end
  end

  describe 'transit route show' do 
    before(:each) do 
      query_params = {
        global_route_id: 'MTABC:94839'
      }
      get "/api/v1/route_details", params: query_params
    end
    
    it 'endpoint exists' do 
      expect(response).to be_successful
    end

    it 'renders useful data' do 
      route_details = JSON.parse(response.body, symbolize_names: true)

      expect(route_details).to have_key(:data)
    end
  end
end