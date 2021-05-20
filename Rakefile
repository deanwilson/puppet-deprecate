require 'puppetlabs_spec_helper/rake_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: %w[spec rubocop]

RuboCop::RakeTask.new
