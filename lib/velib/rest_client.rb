require 'uri'
require 'net/https'

module Velib
  class RestClient
    JCDECAUX_API_KEY = Rails.application.credentials.JCDECAUX_API_KEY

    def get_stations
      path = "https://api.jcdecaux.com/vls/v1/stations?apiKey=#{JCDECAUX_API_KEY}"
      url = URI(path)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      # file = File.open("rest_client_request.json", "w")
      result = JSON.parse(response.read_body, symbolize_names: true)
      # file.puts result.to_json
      result
    end
  end
end
