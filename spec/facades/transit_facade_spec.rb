require 'rails_helper'

RSpec.describe 'Transit Facade' do
  describe 'class methods' do
    it 'returns a list of transit routes' do
      json_response = File.read('spec/fixtures/transit_search.json')
      stub_request(:get, "https://foodhaven-farmers-markets-api.onrender.com/search").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @routes = TransitFacade.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)
      # require 'pry'; binding.pry
      expect

    end
  end
end