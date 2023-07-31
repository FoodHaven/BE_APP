require 'rails_helper'

RSpec.describe 'Market Search Facade' do
  describe 'class methods' do
    it 'returns a list of markets' do
      @markets = MarketSearch.new.all_markets(30.69035, -88.045015, 50)

      expect(@markets).to be_a Array
      expect(@markets.count).to eq 12 
      expect(@markets.first).to be_a Market
      expect(@markets.first.name).to be_a String
      expect(@markets.first.address).to be_a String
      expect(@markets.first.site).to be_a String
      expect(@markets.first.description).to be_a String
      expect(@markets.first.snap_option).to eq nil
      expect(@markets.first.fnap).to be_a String
      expect(@markets.first.latitude).to be_a Float
      expect(@markets.first.longitude).to be_a Float
    end
  end

  it "returns one market" do
    @market = MarketSearch.new.one_market(2)

    expect(@market).to be_a Market
    expect(@market.name).to eq "Market in The Park"
    expect(@market.address).to eq "300 Conti, Mobile, Alabama 36602"
    expect(@market.site).to eq "Local government building grounds;"
    expect(@market.description).to eq "Cathedral Square, located in downtown Mobile, bordered by Conti, Jackson, Dauphin, and Claiborne Streets."
    expect(@market.fnap).to eq "Senior Farmers Market Nutrition Program;"
    expect(@market.snap_option).to eq nil
    expect(@market.accepted_payment).to eq "Debit card/Credit card;"
    expect(@market.longitude).to eq -88.045015
    expect(@market.latitude).to eq 30.69035
  end

  it 'returns favorites' do
    @markets = MarketSearch.new.favorite_markets([12, 34, 56])
    
    expect(@markets.count).to eq 3
    expect(@markets.first.name).to eq "Market in The Park - Lavretta Park"
    expect(@markets.second.name).to eq "Utica Farmers Market"
    expect(@markets.third.name).to eq "Puyallup Farmers' Market"
  end
end