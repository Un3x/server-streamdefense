# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.6'

gem 'aws-sdk-s3', require: false
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma', '>= 5.0'
gem 'rack-cors'
gem 'rails', '~> 8.0.2'
gem 'redis'
gem 'solid_queue'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'factory_bot_rails', '~> 6.5'
  gem 'ffaker'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'timecop'

  gem 'pry'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console'

  gem 'rack-mini-profiler', require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'devise', '~> 4.9'

gem 'tailwindcss-rails', '~> 4.3'
