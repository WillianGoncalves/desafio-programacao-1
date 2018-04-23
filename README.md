# Setting up

## With rvm
* `\curl -sSL https://get.rvm.io | bash -s stable` - Install rvm
* `rvm install 2.4.1` - Install ruby 2.4.1, if not installed
* `cd desafio-programacao-1` - Enter project folder
* `bundle install` - Install gems
* `rails db:create` - Create database
* `rails db:migrate` - Run migrations
* `rails s` - Run server

## Without rvm
* `bundle install` - Install gems
* `rails db:create` - Create database
* `rails db:migrate` - Run migrations
* `rails s` - Run server

# Tests

* `rails test` - Run test
