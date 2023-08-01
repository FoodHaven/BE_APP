require 'rails_helper'

RSpec.describe 'Route Detail Serializer' do
  before(:each) do
    @ts = TransitService.new
    route = @ts.trip_details('MTABC:94839')
    @result = RouteDetailSerializer.format(route)
    @single_stop = @result[:attributes][:stops].first
    require 'pry'; binding.pry
  end

  describe 'general results format' do
    it 'data is an array of data' do 
      expect(@result).to have_key(:data)
      expect(@result[:data]).to be_a Array
    end
    
    it 'has a type' do 
      expect(@result).to have_key(:type)
      expect(@result[:type]).to eq("route")
    end

    it 'has an attributes hash' do 
      expect(@result).to have_key(:attributes)
      expect(@result[:attributes]).to be_a Hash
    end
  end

  describe 'attributes' do 
    it 'includes headsign' do 
      expect(@result[:attributes]).to have_key(:headsign)
      expect(@result[:attributes][:headsign]).to be_a String
    end

    it 'includes an array of stops' do 
      expect(@result[:attributes]).to have_key(:stops)
      expect(@result[:attributes][:stops]).to be_a Array
    end

    it 'array of stops has next departure' do
      expect(@single_stop).to have_key(:next_departure)
      expect(@single_stop[:next_departure]).to be_a Hash
    end
    
    it 'stops have stop name' do
      expect(@single_stop).to have_key(:stop_name)
      expect(@single_stop[:stop_name]).to be_a String
    end
    
    it 'stops have wheelchair boarding info' do 
      expect(@single_stop).to have_key(:wheelchair_boarding)
      expect(@single_stop[:wheelchair_boarding]).to be_a Integer
    end
  end
end