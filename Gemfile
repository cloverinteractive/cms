source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'

gem 'client_side_validations'
gem 'kaminari'
gem 'haml-rails'
gem 'devise'
gem 'paperclip'
gem 'acts-as-taggable-on'
gem 'compass'
gem 'tabs_on_rails'
gem 'jquery-rails'

gem 'acl9', :git => 'https://github.com/be9/acl9.git', :ref => 'dd461ff'

gem 'clovercms-dashboard',  :require => 'dashboard'
gem 'mime-types',           :require => 'mime/types'


group :assets do
  gem 'sass-rails',   '~> 3.1.0'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier'
end

group :development do
  gem 'metric_fu',    :require => false
  gem 'fattr',        :require => false
  gem 'arrayfields',  :require => false
  gem 'map',          :require => false
end

group :development, :test do
  gem 'jasmine'
  gem "rspec-rails",  "~> 2.6"
end

group :test do
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'mocha', :require => false
end

platforms :ruby do
  group :test, :development do
    gem 'sqlite3-ruby', :require => 'sqlite3'
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
