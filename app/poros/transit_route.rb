class TransitRoute
  attr_reader :agency_name, :route_short_name, :headsign, :start_time, :end_time

  def initialize(data)
    @agency_name = data[:agencyName]
    @route_short_name = data[:routeShortName]
    @headsign = data[:headsign]
    @start_time = data[:startTime]
    @end_time = data[:endTime]
  end
end