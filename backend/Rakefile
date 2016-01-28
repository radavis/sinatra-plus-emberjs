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
