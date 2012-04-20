# Clover CMS [![Build Status](http://travis-ci.org/cloverinteractive/clovercms.png)](http://travis-ci.org/cloverinteractive/clovercms)

__A dead simple content management system for Rails 3.2.3__

CloveCMS provides the simpler barebones for creating a website, in v1.1 we embraced an even simpler approach by making it a single user app
that means v1.1 does not support ACL nor multiple users, these features are present on v1.0, if you need ACL and multiple users checkout v1.0,
if all you need a is a simple page generator v1.1 should be enough, if you need more features checkout [RefinercyCMS](https://github.com/resolve/refinerycms)
it comes in a gem.

## Requirements

* [ImageMagick](http://www.imagemagick.org/script/install-source.php)
* [Bundler](http://gembundler.com)

## Getting Started

To install and run in development:

0. `git clone git://github.com/cloverinteractive/clovercms.git`
1. `cd clovercms`
2. `bundle install`
3. `rake db:migrate db:seed`

## Running the tests

`rake spec`

## Supported platforms

We currently test with:

* ruby 1.9.2
* ruby 1.8.7
* ree

### JRuby

We take JRuby into consideration, and our Gemfile works nice with its platforms, but since we can only version one instance, we don't build against it. However you can use `clovercms` with JRuby by doing the following:

0. `rm -f Gemfile.lock`
1. `jruby -S bundle install`

## Contribute

Feel free to submit a pull request and don't forget to add your name to the list below.

## Contributors

* [Enrique Vidal](http://github.com/EnriqueVidal)
* [Adan Alvarado](http://github.com/aalvarado)
* [ulisesroche](http://github.com/ulisesroche)
