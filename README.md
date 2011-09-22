# Clover CMS [![Build Status](http://travis-ci.org/cloverinteractive/clovercms.png)](http://travis-ci.org/cloverinteractive/clovercms)

__A dead simple content management system for Rails 3.__

## Requirements

* [metric_fu](http://metric-fu.rubyforge.org/)
* [ImageMagick](http://www.imagemagick.org/script/install-source.php)
* [Bundler](http://gembundler.com)

## Getting Started

To install and run in development:

0. `git clone git://github.com/cloverinteractive/clovercms.git`
1. `cd clovercms`
2. `bundle install`
3. `rake db:migrate db:seed`

This part is optional, it will compile and install wymeditor for page editing, you will need `make` for this.

0. `git submodule init`
1. `git submodule update`
2. `rake wymeditor:compile`

## Running the tests

`rake test`

## Supported platforms

We currently test with:

* ruby 1.9.2
* ruby 1.8.7
* ree

### JRuby

We take JRuby into consideration, and our Gemfile works nice with its platforms, but since we can only version one instance, we don't build against it. However you can use `clovercms` with JRuby by doing the following:

0. `rm -f Gemfile.lock`
1. `jruby -S bundle install`

## Check code metrics

To run code metrics, `rake metrics:all`

## Contribute

Feel free to submit a pull request and don't forget to add your name to the list below.

## Contributors

* [Enrique Vidal](http://github.com/EnriqueVidal) - Creator, ruby developer
* [Adan Alvarado](http://github.com/aalvarado) - Designer of the Open Source Dashboard theme and front-end developer
* [ulisesroche](http://github.com/ulisesroche)
