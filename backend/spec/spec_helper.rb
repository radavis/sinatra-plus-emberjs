ENV["RACK_ENV"] ||= "test"

require_relative "../app"
require "rspec"
require "capybara/rspec"
require "pry"

spec_support_files = File.join(App.settings.root, "spec", "support", "**", "*.rb")
Dir[spec_support_files].each { |file| require file }

Capybara.app = App

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random
  Kernel.srand config.seed
end
