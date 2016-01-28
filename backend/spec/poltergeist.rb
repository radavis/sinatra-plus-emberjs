require "spec_helper"
require "capybara/poltergeist"

Capybara.configure do |config|
  config.app_host = "http://localhost:4200"
  config.default_driver = :poltergeist
end
