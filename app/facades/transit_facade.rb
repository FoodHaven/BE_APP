class TransitFacade
  def self.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    service = TransitService.new
    request = service.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    require 'pry'; binding.pry
    @routes = request[:plan][:itineraries].map do |route|
      TransitRoute.new
    end
  end
end