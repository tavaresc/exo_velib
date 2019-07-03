require 'uri'
require 'net/https'

module StationsHelper
  @number_of_stations = 0
  @number_of_stands = 0
  @nearest_stations = [] # TODO: virer ça, envoyer en retour

  def add_available_stands(station, current_available_stands)
    stands_array = station.available_stands.split(' ') << current_available_stands.to_s

    if stands_array.length > @number_of_stands # stands_array.length == 10 (To test!)
      stands_array.drop(stands_array.length - @number_of_stands)
    end

    # stands_array.length > @number_of_stands || stands_array.drop(stands_array.length - @number_of_stands)
    stands_array.join(' ')
  end

  def set_sizes(n_stations, n_stands)
    @number_of_stations = n_stations
    @number_of_stands = n_stands
  end

  def check_position(lat, lng)
    stations = Station.all
    stations.each do |s|
      s_distance = Geocoder::Calculations.distance_between([lat, lng], [s['latitude'], s['longitude']])

      if @nearest_stations.blank?
        @nearest_stations = [{ 'station' => s, 'distance' => s_distance }]
      elsif @nearest_stations.size < @number_of_stations
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