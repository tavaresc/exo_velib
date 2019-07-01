require 'uri'
require 'net/https'

module PositionsHelper
  @size = 0
  @nearest_positions = []

  def get_velib_api
    jcdecaux_api_key = Rails.configuration.jcdecaux_api_key #TODO: improve the way to set key
    path = "https://api.jcdecaux.com/vls/v1/stations?apiKey=#{jcdecaux_api_key}"
    url = URI(path)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    JSON.parse(response.read_body)
  end

  def set_number_of_positions(n)
    @size = n
  end

  def check_position(p, lat, lng)
    p_distance = Geocoder::Calculations.distance_between([lat, lng], [p['lat'], p['lng']])

    if @nearest_positions.blank?
      @nearest_positions = [{ 'position' => p, 'distance' => p_distance }]
    elsif @nearest_positions.size < @size
      @nearest_positions << { 'position' => p, 'distance' => p_distance }
    else
      @nearest_positions = @nearest_positions.map do |near_p|
        if (p_distance < near_p['distance'])
          p_distance
        end
      end
    end
  end
end
