require 'rails_helper'

RSpec.describe TransitService do
  # let(:origin) { 40.77709768562554, -73.87400881765025 }
  # let(:destination) { 40.748594902847515, -73.98564294463469 }

  describe '.get_trips' do
    before :each do
      VCR.use_cassette("transit_service_get_trips") do
        @trips = TransitService.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)
      end
    end

    it 'returns a hash' do
      expect(@trips).to be_a(Hash)
    end

    it 'returns itineraries in an array' do
      expect(@trips).to have_key(:plan)
      expect(@trips[:plan]).to have_key(:itineraries)
      expect(@trips[:plan][:itineraries]).to be_a(Array)
    end

    context 'when itineraries are present' do
      before do
        expect(@trips[:plan][:itineraries]).to_not be_empty
        @first_itinerary = @trips[:plan][:itineraries].first
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
