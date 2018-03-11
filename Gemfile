source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Line::Bot::API - SDK of the LINE Messaging API for Ruby.
# https://github.com/line/line-bot-sdk-ruby
gem 'line-bot-api'

# Easiest way to add multi-environment yaml settings to Rails,
# Sinatra, Pandrino and other ruby projects.
# https://github.com/railsconfig/config
gem 'config', '1.7.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0.
  # https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '3.7.2'

  # factory_bot is a fixtures replacement with a straightforward
  # definition syntax, support for multiple build strategies (saved
  # instances, unsaved instances, attribute hashes, and stubbed
  # objects), and support for multiple factories for the same class
  # (user, admin_user, and so on), including factory inheritance.
  gem 'factory_bot_rails', '4.8.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Rails >= 3 pry initializer
  # https://github.com/rweng/pry-rails
  gem 'pry-rails', '0.3.6'
end

group :test do
  # Collection of testing matchers extracted from Shoulda
  # http://matchers.shoulda.io
  gem 'shoulda-matchers', '3.1.2'

  # Strategies for cleaning databases in Ruby. Can be used to ensure a
  # clean state for testing.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner', '1.6.1'
end
