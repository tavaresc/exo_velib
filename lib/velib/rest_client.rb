require 'uri'
require 'net/https'

module RestClient
  def get_velib_api
    jcdecaux_api_key = Rails.application.credentials.JCDECAUX_API_KEY
    path = "https://api.jcdecaux.com/vls/v1/stations?apiKey=#{jcdecaux_api_key}"
    url = URI(path)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    http.request(request)
  end
end
