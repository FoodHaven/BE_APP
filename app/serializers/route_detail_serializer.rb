class RouteDetailSerializer
  def self.format(response)
    {
      data: [
        {
          type: 'route', 
          attributes: {
            headsign: response[:itineraries].first[:headsign], 
            stops: response[:itineraries].first[:stops]
          }
        }
      ]
    }
  end
end