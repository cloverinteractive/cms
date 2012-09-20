source 'http://rubygems.org'

gem 'rails', '3.2.8'

gem 'will_paginate'
gem 'haml-rails'
gem 'devise'
gem 'paperclip'
gem 'acts-as-taggable-on'
gem 'tabs_on_rails'
gem 'jquery-rails'
gem 'simple_form'
gem 'single_test'
gem 'capistrano'
gem 'mime-types', :require => 'mime/types'
gem 'symbolize'
gem 'friendly_id', '~> 4.0.1'

group :development do
  gem 'quiet_assets'
  gem 'bullet'
  gem 'pry-rails'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
  gem 'compass-rails'
  gem 'fancybox-rails'
 end

group :development, :test do
  gem "rspec-rails",  "~> 2.6"
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara-webkit'
  gem 'mocha', :require => false
end

platforms :ruby do
  group :test, :development do
    gem 'sqlite3'
  end

  group :production do
    gem 'mysql2'
  end
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jruby-openssl'
  gem 'trinidad'
  gem 'ffi-ncurses'

  group :test, :development do
    gem 'jdbc-sqlite3'
  end

  group :production do
    gem 'jdbc-mysql', :require => false
  end
end
