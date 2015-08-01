Libre Mercado
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.


Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.3

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------
Project setup

Copy from this drive folder database.yml to config/database.yml 

sudo -u postgres createuser -d -R -P libre_mercado

Complete with root password and when asked for a password set: libre_mercado

 
sudo -u postgres createdb -O libre_mercado libre_mercado

Modify config/database.yml and set password to libre_mercado

Run in console

rake db:create:all
rake db:migrate













Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
