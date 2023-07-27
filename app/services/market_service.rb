class MarketService
  def conn
    Faraday.new(url: "https://foodhaven-farmers-markets-api.onrender.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_markets
    get_url("/api/v1/markets")
  end
end