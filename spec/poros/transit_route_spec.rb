require 'rails_helper'

RSpec.describe TransitRoute, type: :model do
  describe 'create transit route object' do
    it 'has transit route attributes' do
      route = TransitRoute.new("RTD", "225", "Downtown Denver", "2020-09-01T05:00:00", "2020-09-01T05:30:00")

      expect(route).to be_a(TransitRoute)
      expect(route.agency_name).to eq("RTD")
      expect(route.route_short_name).to eq("225")
      expect(route.headsign).to eq("Downtown Denver")
      expect(route.start_time).to eq("2020-09-01T05:00:00")
      expect(route.end_time).to eq("2020-09-01T05:30:00")
    end
  end
end
