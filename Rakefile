require 'bundler'
require 'rspec/core/rake_task'

task :default => :test

RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
