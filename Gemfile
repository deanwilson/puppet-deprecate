source 'https://rubygems.org'

group :development, :test do
  gem 'json'
  gem 'puppetlabs_spec_helper', '~> 8.0.0'
  gem 'rake', '~> 13.2.1'
  gem 'rspec', '~> 3.13.0'
  gem 'rubocop', '~> 1.75.1', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', '~> 3.6.0', require: false
  gem 'simplecov', '~> 0.22.0'
  gem 'timecop'
end

if (puppetversion = ENV.fetch('PUPPET_GEM_VERSION', nil))
  gem 'puppet', puppetversion, require: false
else
  gem 'puppet', require: false
end
