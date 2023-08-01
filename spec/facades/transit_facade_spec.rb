require 'rails_helper'

RSpec.describe 'Transit Facade' do
  describe 'class methods' do
    it 'returns a list of transit routes' do
      @routes = TransitFacade.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)
      expect(@routes).to be_an Array
      expect(@routes.count).to eq 2
      @routes.each do |route|
        expect(route).to be_an TransitRoute
        expect(route.agency_name).to be_a String
        expect(route.headsign).to be_a String
        expect(route.route_short_name).to be_a String
        expect(route.start_time).to be_a Integer
        expect(route.end_time).to be_a Integer
      end
    end
  end
end