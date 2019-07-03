require 'uri'
require 'net/https'

module StationsHelper
  @size = 0
  @nearest_stations = []

  def get_velib_api
    jcdecaux_api_key = Rails.configuration.jcdecaux_api_key #TODO: improve the way to set key
    path = "https://api.jcdecaux.com/vls/v1/stations?apiKey=#{jcdecaux_api_key}"
    url = URI(path)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    data = JSON.parse(response.read_body)
    data.each do |d|
      station = Station.find_by(id_number: d["number"]) || Station.new
      station.id_number = d["number"]
      station.latitude = d["position"]["lat"]
      station.longitude = d["position"]["lng"]
      station.available_stands << d["available_bike_stands"]
      station.available_stands << d["available_bike_stands"]

      if station.save
        p "------- saved station"
      else
        p "------- station not saved"
      end
    end
  end

  def set_number_of_stations(n)
    @size = n
  end

  def check_position(lat, lng)
    stations = Station.all
    stations.each do |s|
      s_distance = Geocoder::Calculations.distance_between([lat, lng], [s['latitude'], s['longitude']])

      if @nearest_stations.blank?
        @nearest_stations = [{ 'station' => s, 'distance' => s_distance }]
      elsif @nearest_stations.size < @size
        @nearest_stations << { 'station' => s, 'distance' => s_distance }
      else
        updated_stations = @nearest_stations.map do |near_s|
          if (s_distance < near_s['distance'])
            s_distance
          end
          @nearest_stations = updated_stations
        end
      end
    end
  end
end