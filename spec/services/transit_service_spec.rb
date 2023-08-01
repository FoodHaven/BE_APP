require 'rails_helper'

RSpec.describe TransitService do
  describe '.get_trips' do
    context 'when itineraries are present' do
      before :each do
        @routes = TransitService.new.get_trips(40.77709768562554, -73.87400881765025, 40.748594902847515, -73.98564294463469)[:plan]
        @first_itinerary = @routes[:itineraries].first
        @first_leg = @first_itinerary[:legs].first
      end
      
      it 'returns itineraries in an array' do
        expect(@routes).to be_a Hash
        expect(@routes).to have_key :itineraries
        expect(@routes[:itineraries]).to be_a Array
        expect(@routes[:itineraries]).to_not be_empty
      end

      it 'has a duration of 505 in the first leg of the first itinerary' do
        expect(@first_itinerary).to have_key :legs
        expect(@first_itinerary[:legs]).to be_a Array
        expect(@first_itinerary[:legs]).to_not be_empty
        expect(@first_leg).to have_key :duration
        expect(@first_leg[:duration]).to eq 549
      end
    end

    describe '#trip_details' do 
      before(:each) do
        @ts = TransitService.new
      end

      it 'returns a single route' do 
        route = @ts.trip_details('MTABC:94839')
        
        expect(route)
        require 'pry'; binding.pry
      end
    end
  end
end
