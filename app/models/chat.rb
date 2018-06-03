# get API from weather.livedoor.com
require 'net/http'
require 'json'
require 'uri'

class Chat < ApplicationRecord
  def self.get_weather
    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    res = Net::HTTP.get_response(uri)
    json = JSON.parse(res.body)
    json["forecasts"][0]["telop"]
  end
end
