source "https://rubygems.org"

gem "rails", "~> 3.2.0"
gem "pg"

gem "devise"

# Better random number generator
gem "simple-random"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sprockets-rails"
  gem "sass-rails"
  gem "coffee-rails"

  gem "d3-rails"
  gem "jquery-rails"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem "therubyracer", platforms: :ruby

  gem "uglifier", ">= 1.0.3"
end

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
end

group :test, :development do
  gem "pry-rails"
  gem "pry-remote"
  gem "debugger-pry"
end

