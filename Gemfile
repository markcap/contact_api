source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3.2'
# Use Puma as the app server
gem 'puma', '~> 5.3.1'
gem 'pg', '~> 1.2.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'sitemap_generator', '~> 6.1.2'
gem 'httparty', '~> 0.18.1'

gem "sentry-ruby", '4.4.2'
gem "sentry-rails", '4.4.0'
gem "whenever", '1.0.0'

group :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'database_cleaner-active_record', '~> 2.0.1'
  gem 'simplecov', '~> 0.21.2'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
