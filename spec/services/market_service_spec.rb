require 'rails_helper'

RSpec.describe MarketService do
  it 'can create a connection and consume API' do
    markets = MarketService.all_markets

    expect(markets).to be_a(Array)
  end
end