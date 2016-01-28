require "factory_girl"

# load factory definitions
factories = File.join(App.settings.root, "spec", "factories", "*.rb")
Dir[factories].each { |file| require file }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
