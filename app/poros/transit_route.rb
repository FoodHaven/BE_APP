class TransitRoute
  attr_reader :agency_name, :route_short_name, :headsign, :start_time, :end_time

  def initialize(data)
    @agency_name = data[:agency_name]
    @route_short_name = data[:route_short_name]
    @headsign = data[:headsign]
    @start_time = data[:start_time]
    @end_time = data[:end_time]
  end
end