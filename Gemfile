source 'http://rubygems.org'

gem 'rails', '3.2.14'

gem 'bootstrap-will_paginate'
gem 'haml-rails'
gem 'devise'
gem 'devise_invitable'
gem 'carrierwave'
gem 'rmagick'
gem 'acts-as-taggable-on'
gem 'tabs_on_rails'
gem 'jquery-rails'
gem 'simple_form'
gem 'capistrano'
gem 'mime-types', :require => 'mime/types'
gem 'symbolize'
gem 'friendly_id', '~> 4.0.1'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debugger'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'pry-rails'
  gem 'rails_best_practices'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
  gem 'therubyracer'
  gem 'compass-rails'
  gem 'bootstrap-sass'
  gem 'fancybox-rails'
 end

group :development, :test do
  gem 'rspec-rails'
  gem 'single_test'
  gem 'launchy'
  gem 'evergreen',    :group => [ :test, :development ], :require => 'evergreen/rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '1.7.0'
  gem 'capybara-webkit'
  gem 'mocha', :require => false
  gem 'simplecov'
end

platforms :ruby do
  group :test, :development do
    gem 'sqlite3'
  end

  group :production do
    gem 'mysql2'
  end
end
