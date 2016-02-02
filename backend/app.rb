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
    index = File.join(settings.public_folder, 'index.html')
    send_file(index)
  end

  namespace "/api" do
    before do
      # only necessary for development?
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
