class MarketService
  def conn
    Faraday.new(url: "https://foodhaven-farmers-markets-api.onrender.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_markets(latitude, longitude, radius)
    get_url("/api/v1/markets/search?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}")
  end

  def one_market(id)
    get_url("/api/v1/markets/#{id}")
  end

  def favorite_markets(ids)
    params = {market_ids: ids}
    response = conn.get("/api/v1/markets/favorites", params)
    JSON.parse(response.body, symbolize_names: true)
  end
end