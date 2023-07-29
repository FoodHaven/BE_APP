class TransitFacade
  # def self.plan_trip(origin_lat, origin_lon, destination_lat, destination_lon)
  #   TransitService.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
  # end
  def self.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    service = TransitService.new
    request = service.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    @routes = request[:plan][:itineraries].map do |route|
      TransitRoute.new
    end
  end
end