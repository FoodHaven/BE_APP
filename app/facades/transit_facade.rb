class TransitFacade
  def self.plan_trip(origin_lat, origin_lon, destination_lat, destination_lon)
    TransitService.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
end