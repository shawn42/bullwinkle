source :rubygems
ruby "1.9.3"

gem 'rails', github: 'rails/rails'
gem 'journey', github: 'rails/journey'

# Better random number generator
gem "simple-random"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'

  gem 'd3-rails'
  gem 'jquery-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'sqlite3'
end

group :test, :development do
  gem "rspec"
  gem "rspec-rails"
end
