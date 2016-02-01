require "dotenv"
Dotenv.load

require "json"
require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/namespace"
require "sinatra/json"
require "./models/rental"

class App < Sinatra::Base
  register Sinatra::JSON
  register Sinatra::Namespace

  get '/' do
    File.new('public/index.html').readlines
  end

  namespace "/api" do
    before do
      headers 'Access-Control-Allow-Origin' => ENV["EMBER_APP_URL"]
    end

    get("/rentals") do
      json({ rentals: Rental.order(:created_at).limit(10) })
    end

    not_found do
      json({ message: "Not Found" })
    end
  end
end
