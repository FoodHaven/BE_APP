class TransitRoute
  attr_reader :agency_name, :route_short_name, :headsign, :start_time, :end_time, :global_route_id

  def initialize(data)
    @agency_name = data[:agencyName]
    @route_short_name = data[:routeShortName]
    @headsign = data[:headsign]
    @start_time = data[:startTime]
    @end_time = data[:endTime]
    @global_route_id = data[:globalRouteId]
  end
end