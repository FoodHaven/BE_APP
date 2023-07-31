class MarketSearch
  def all_markets(latitude, longitude, radius)
    request = service.all_markets(latitude, longitude, radius)
    @markets = request[:data].map do |mark|
      Market.new(mark[:attributes])
    end
  end

  def one_market(id)
    request = service.one_market(id)
    data = request[:data]
    @market = Market.new(data[:attributes])
  end

  def favorite_markets(ids)
    request = service.favorite_markets(ids)
    @markets = request[:data].map do |mark|
      Market.new(mark[:attributes])
    end
  end

  def service
    service = MarketService.new
  end
end