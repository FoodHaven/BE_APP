class TransitService
  def self.conn
    Faraday.new(url: 'https://external.transitapp.com/v3') do |f|
      f.headers['apiKey'] = ENV['transit_api_key']
    end
  end

  def self.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    response = conn.get("otp/plan?fromPlace=#{origin_lat}, #{origin_lon}&toPlace=#{destination_lat}, #{destination_lon}")
    data = JSON.parse(response.body, symbolize_names: true)

  end
end



