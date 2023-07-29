class TransitService
  def conn
    Faraday.new(url: 'https://external.transitapp.com') do |f|
      f.headers['apiKey'] = ENV['transit_api_key']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    get_url("/v3/otp/plan?fromPlace=#{origin_lat},#{origin_lon}&toPlace=#{destination_lat},#{destination_lon}")
  end
end



