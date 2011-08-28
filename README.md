# Clover CMS [![Build Status](http://travis-ci.org/cloverinteractive/clovercms.png)](http://travis-ci.org/cloverinteractive/clovercms)

__A dead simple content management system for Rails 3.__

## Requirements

* [metric_fu](http://metric-fu.rubyforge.org/)
* [ImageMagick](http://www.imagemagick.org/script/install-source.php)
* [Bundler](http://gembundler.com)

## Getting Started

To install and run for development simply download and use rake as follows:

0. `git clone git://github.com/cloverinteractive/clovercms.git`
1. `cd clovercms`
2. `bundle install`
3. `rake db:migrate db:seed`

This part is optional, it will compile and install wymeditor for page editing, you will need `make` for this.

0. `git submodule init`
1. `git submodule update`
2. `rake wymeditor:compile`

## Running the tests

Simply run `rake test`

## Supported platforms

We currently test in:

* ruby 1.9.2
* ruby 1.8.7
* ree
* juby 1.6.2

## Check code metrics

To run all the code metrics, simply run `rake metrics:all`

## Contribute

Feel free to submit a pull request, and add your self to the contributors list in this README file.

## Contributors

* [Enrique Vidal](http://github.com/EnriqueVidal) - Creator, ruby developer
* [Adan Alvarado](http://github.com/aalvarado) - Designer of the Open Source Dashboard theme and front-end developer
