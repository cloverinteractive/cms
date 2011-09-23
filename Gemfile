source 'http://rubygems.org'

gem 'rails', '3.0.10'
gem 'client_side_validations', '3.0.2'
gem 'kaminari'
gem 'sass'
gem 'haml-rails'
gem 'devise'
gem 'paperclip'
gem 'acts-as-taggable-on'
gem 'mime-types', :require => 'mime/types'
gem "compass", ">= 0.10.6"
gem 'tabs_on_rails'
gem 'jquery-rails'
gem 'acl9'
gem 'capistrano'
gem 'clovercms-dashboard', :require => 'dashboard'

group :development do
  gem 'metric_fu',    :require => false
  gem 'fattr',        :require => false
  gem 'arrayfields',  :require => false
  gem 'map',          :require => false
end

group :development, :test do
  gem 'jasmine',      "~> 1.1.0.rc4"
  gem "rspec-rails",  "~> 2.6"
end

group :test do
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
