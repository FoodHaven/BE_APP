require 'rails_helper'

RSpec.describe TransitService do
  describe '.get_trips' do
    before :each do
      # VCR.use_cassette("transit_service_get_trips") do
      #   @routes = TransitService.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)
      # end
      json_response = File.read('spec/fixtures/transit_search.json')
      stub_request(:get, "https://external.transitapp.com/v3/otp/plan?fromPlace=40.77709768562554,-73.87400881765025&toPlace=40.748594902847515,-73.98564294463469").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @routes = TransitService.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)
    end

    it 'returns a hash' do
      expect(@routes).to be_a(Hash)
    end

    it 'returns itineraries in an array' do
      expect(@routes).to have_key(:plan)
      expect(@routes[:plan]).to have_key(:itineraries)
      expect(@routes[:plan][:itineraries]).to be_a(Array)
    end

    context 'when itineraries are present' do
      before do
        expect(@routes[:plan][:itineraries]).to_not be_empty
        @first_itinerary = @routes[:plan][:itineraries].first
      end

      it 'has a duration of 505 in the first leg of the first itinerary' do
        expect(@first_itinerary).to have_key(:legs)
        expect(@first_itinerary[:legs]).to be_a(Array)
        expect(@first_itinerary[:legs]).to_not be_empty

        first_leg = @first_itinerary[:legs].first
        expect(first_leg).to have_key(:duration)
        expect(first_leg[:duration]).to eq(549)
      end
    end
  end
end
