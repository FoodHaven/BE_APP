class TransitFacade
  def self.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    service = TransitService.new
    request = service.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    route_data = request[:plan][:itineraries]
    legs_data = route_data.map do |r|
      r[:legs]
    end
    leg_info = legs_data.first.select do |leg|
      leg[:agencyName].nil? == false
    end
    routes = leg_info.map do |leg|
      TransitRoute.new(leg)
    end
  end
end