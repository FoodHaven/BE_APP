class TransitService
  def self.conn
    Faraday.new(url: 'https://external.transitapp.com/v3') do |f|
      f.headers['api_key'] = ENV['transit_api_key']
    end
  end

  def self.get_trips(origin_lat, origin_lon, destination_lat, destination_lon)
    require 'pry'; binding.pry
    JSON.parse(conn.get("otp/plan?fromPlace=#{origin_lat}, #{origin_lon}&toPlace=#{destination_lat}, #{destination_lon}"), symbolize_names: true)
  end
end



