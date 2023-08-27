class MarketService
  def conn
    Faraday.new(url: "https://foodhaven-df0d805938ff.herokuapp.com/")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_markets(latitude, longitude, radius)
    get_url("markets/search?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}")
  end

  def one_market(id)
    get_url("markets/#{id}")
  end

  def favorite_markets(ids)
    params = {market_ids: ids}
    response = conn.get("markets/favorites", params)
    JSON.parse(response.body, symbolize_names: true)
  end
end