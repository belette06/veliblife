source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby File.read('./.ruby-version')
File.read('./.ruby-version')

gem 'rails', '~> 6.0.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'coffee-rails', '~> 4.2'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pry', '~> 0.12.2'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'faker', '~> 1.9', '>= 1.9.3'
gem 'geocoder', '~> 1.5', '>= 1.5.1'
gem 'httparty', '~> 0.13.7'
gem 'sidekiq', '~> 5.2', '>= 5.2.7'
gem 'sidekiq-scheduler', '~> 3.0'
gem 'redis-rails'
gem 'redis-rack-cache'
gem 'leaflet-rails', '~> 0.7.7'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.71.0', require: false
  gem 'rubocop-rspec', '~> 1.33', require: false
  gem 'annotate', '~> 2.7', '>= 2.7.5'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'codecov', require: false
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'webdrivers', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
