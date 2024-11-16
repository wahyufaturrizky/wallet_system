require 'net/http'
require 'json'

class LatestStockPrice
  API_KEY = ENV['RAPIDAPI_KEY']
  BASE_URL = 'https://latest-stock-price.p.rapidapi.com/'

  def self.fetch_data(endpoint)
    uri = URI("#{BASE_URL}#{endpoint}")
    request = Net::HTTP::Get.new(uri)
    request['X-RapidAPI-Key'] = API_KEY
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(request) }
    JSON.parse(response.body)
  end
end
