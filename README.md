# Clover CMS [![Build Status](http://travis-ci.org/cloverinteractive/clovercms.png)](http://travis-ci.org/cloverinteractive/clovercms)

__ A dead simple content management system for Rails 3.__

## Requirements

* [metric_fu](http://metric-fu.rubyforge.org/)
* [ImageMagick](http://www.imagemagick.org/script/install-source.php)
* [Bundler](http://gembundler.com)

## Getting Started

To install and run for development simply download and use rake as follows:

  git clone git://github.com/cloverinteractive/clovercms.git # clone the project
  cd clovercms # go into the project directory
  bundle install # install the gems
  rake db:migrate db:seed # create and populate the development database
  rails s # start the rails server

## Running the tests

Simply run `rake test`

## Check code metrics

To run all the code metrics, simply run `rake metrics:all`
