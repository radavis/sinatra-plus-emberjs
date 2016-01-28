# Sinatra plus Ember.js

The goal of this project is to document the steps necessary to create a barebones app with the following libraries:

* Sinatra, ActiveRecord Back-end
* Ember.js Front-end
* Capypbara feature specs
* RSpec unit tests

## Bower

> Bower can manage components that contain HTML, CSS, JavaScript, fonts or even image files. Bower doesn’t concatenate or minify code or do anything else - it just installs the right versions of the packages you need and their dependencies.

[Source](http://bower.io/)

### Instructions

```no-highlight
$ brew install node
$ npm install -g bower
```

Choose where Bower-managed dependencies will live:

```js
// .bowerrc

{
  "directory": "public/vendor/javascripts"
}
```

Install Bower-managed dependencies dependencies

```no-highlight
$ bower init
$ bower install babel react components/jquery marked jasmine-core jasmine-ajax --save
```

What can I install with Bower? [Search Bower packages](http://bower.io/search/)

## Ruby-based Dependencies

Go in the `Gemfile`, obvi.

```ruby
# Gemfile

source "https://rubygems.org/"

gem "pg", "~> 0.18"
gem "rake"
gem "sinatra", "~> 1.4"
gem "sinatra-activerecord", "~> 2.0"

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "factory_girl"
  gem "poltergeist"
  gem "rspec"
end

group :test, :development do
  gem "pry"
end
```

### ActiveRecord Configuration

Create a `config/database.yml` file.

```yaml
development: &default
  host: localhost
  adapter: postgresql
  database: <DB_NAME>_development
  encoding: utf8
  min_messages: warning
  pool: 5
  timeout: 5000

test:
  <<: *default
  database: <DB_NAME>_test

production:
  <<: *default
  database: <DB_NAME>_production
```

### Install Ruby Gems, Migrate, and Start the Sinatra Server

```no-highlight
$ brew install phantomjs
$ bundle
$ rake db:create && rake db:migrate && rake db:seed
$ rackup
```

Navigate to [localhost:9292](http://localhost:9292/) in your browser.

## Testing

### Setup

```no-highlight
$ rspec --init
$ mkdir spec/factories spec/features spec/models spec/support
```

### Running RSpec/Capybara Tests

Set up the `Rakefile`.

```ruby
# Rakefile

require "sinatra/activerecord/rake"
require "rspec/core/rake_task"

# configure sinatra-activerecord rake tasks
namespace :db do
  task :load_config do
    require "./app"
  end
end

# create a task to run RSpec tests
RSpec::Core::RakeTask.new do |task|
  task.name = :spec
  # task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern = "spec/**/*_spec.rb"
end

# set the default rake task
task default: :spec
```

Configure the test suite.

```ruby
# spec/spec_helper.rb

ENV["RACK_ENV"] ||= "test"

require_relative "../app"
require "rspec"
require "capybara/rspec"
require "capybara/poltergeist"
require "pry"

spec_support_files = File.join(App.settings.root, "spec", "support", "**", "*.rb")
Dir[spec_support_files].each { |file| require file }

Capybara.app = App
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random
  Kernel.srand config.seed
end
```

```ruby
# spec/support/database_cleaner.rb

require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
```

```ruby
# spec/support/factory_girl.rb

require "factory_girl"

# load factory definitions
factories = File.join(App.settings.root, "spec", "factories", "**", "*.rb")
Dir[factories].each { |file| require file }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
```

Run the test suite.

```no-highlight
$ rake
```

## Exploring React.js

The code in `public/javascripts/app.js` is from the [React Tutorial](https://facebook.github.io/react/docs/tutorial.html). If you would like to work through their tutorial, delete the contents of `app.js`, and follow along from the "[Your first component](https://facebook.github.io/react/docs/tutorial.html#your-first-component)", section.
