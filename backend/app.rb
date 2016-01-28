require "json"
require "sinatra/base"
require "sinatra/activerecord"
require "./models/rental"

class App < Sinatra::Base
  get("/api/rentals") do
    content_type :json
    { rentals: Rental.order(:created_at).limit(10) }.to_json
  end
end
