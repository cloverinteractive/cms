# Clover CMS [![Build Status](https://travis-ci.org/cloverinteractive/cms.png?branch=master)](https://travis-ci.org/cloverinteractive/cms)

__A dead simple content management system for Rails 3.2.14__

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
3. `rake db:setup`

## Running the tests

`rake spec`

## Supported platforms

We currently test with:

* ruby 2.0.0
* ruby 1.9.3

Feel free to submit a pull request and don't forget to add your name to the list below.

## Contributors

* [Enrique Vidal](http://github.com/EnriqueVidal)
* [Adan Alvarado](http://github.com/aalvarado)
* [ulisesroche](http://github.com/ulisesroche)
