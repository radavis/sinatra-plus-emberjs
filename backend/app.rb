require "dotenv"
Dotenv.load

require "json"
require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/json"
require "./models/rental"

class App < Sinatra::Base
  before do
    headers 'Access-Control-Allow-Origin' => ENV["EMBER_APP_URL"]
  end

  get("/api/rentals") do
    json({ rentals: Rental.order(:created_at).limit(10) })
  end

  not_found do
    json({ message: "Not Found" })
  end
end
