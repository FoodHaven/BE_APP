class TransitRoute
  attr_reader :agency_name, :route_short_name, :headsign, :start_time, :end_time

  def initialize(agency_name, route_short_name, headsign, start_time, end_time)
    @agency_name = agency_name
    @route_short_name = route_short_name
    @headsign = headsign
    @start_time = start_time
    @end_time = end_time
  end
end