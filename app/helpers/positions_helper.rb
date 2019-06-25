require 'uri'
require 'net/http'

module PositionsHelper
  def get_velib_api
    jcdecaux_api_key = ENV["JCDECAUX_API_KEY"]
    url = URI("https://api.jcdecaux.com/vls/v1/stations?contract=Lyon&apiKey=#{jcdecaux_api_key}")

    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    byebug
    response.read_body
  end
end
