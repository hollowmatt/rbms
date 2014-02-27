wungine
=======

Weather Underground Rails Engine.  This engine is built on Ruby 2.1, with Rails 4.0.3  

## Setup
You will need to add the gem to your gemfile in the rails hosting application

	gem 'wungine'

You will then want to run bundle to install the gem.  Once that is complete, crack open your 
routes.rb file, and mount to your favorite location.

	mount Wungine::Weather '/weather'


