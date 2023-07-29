class MarketSearch
  def all_markets(latitude, longitude, radius)
    service = MarketService.new
    request = service.all_markets(latitude, longitude, radius)
    @markets = request[:data].map do |mark|
      Market.new(mark[:attributes])
    end
  end

  def one_market(id)
    service = MarketService.new
    request = service.one_market(id)
    @market = Market.new(request[:data].first)
  end
end