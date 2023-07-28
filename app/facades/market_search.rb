class MarketSearch
  def all_markets
    service = MarketService.new
    request = service.all_markets
    @markets = request[:data].map do |mark|
      Market.new(mark)
    end
  end

  def one_market(id)
    service = MarketService.new
    request = service.one_market(id)
    @market = Market.new(request[:data].first)
  end
end