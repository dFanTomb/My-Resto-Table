require 'open-uri'
require 'net/http'
require 'json'

restaurants_api = 'https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/restaurants-casvp/records?limit=43'

class GetRequester
  def initialize(url)
    @url = url
  end

  def get_response_body
    url = URI.parse(@url)
    response = Net::HTTP.get_response(url)
    JSON.parse(response.body)
  end
end

restaurants_response = GetRequester.new(restaurants_api)
restaurants = restaurants_response.get_response_body

restaurants["results"].each do |restaurant|
    postal_code = restaurant["code"]
    name = restaurant["nom_restaurant"]&.titleize
    address = restaurant["adresse"]&.titleize
    city = restaurant["ville"]&.titleize
  Restaurant.create(postal_code: postal_code, name: name, address: address, city: city)
end

## !! In Restaurant model, comment "validates" line first before rails db:seed !! Otherwise Restaurant.all will be EMPTY. After seeding, uncoment the "validates" line in Restaurant model file (restaurant.rb).

# require "json"
# require "open-uri"

# url = "https://api.github.com/users/ssaunier"
# user_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)
