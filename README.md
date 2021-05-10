# News



# Getting Jquery and Bootstrap Up

## Install Yarn

add repository from yarn install webpage
apt-get update && apt-get install yarn

## Install bootstrap jquery and popper.js

yarn add boostrap jquery popper.js

## Add boostrap to application.scss

@import "bootstrap/scss/bootstrap";

## config/webpack/environment.js

const { environment } = require('@rails/webpacker')

module.exports = environment


import { environment } from '@rails/webpacker'

import { ProvidePlugin } from 'webpack'
environment.plugins.append('Provide', 
	new ProvidePlugin({
		s: 'jquery',
		jQuery: 'jquery',
		Popper: ['popper.js', 'default']
	}))

export default environment


## Add requires for custom js to javascript/packs/application.js

require("channels")
require("packs/main.js")


# PostgreSQL 

## Installing

sudo apt-get install postgresql postgresql-client libpq5 libpq-dev
sudo gem install pg

## Setup

sudo -u postgres psql
postgres=# \password
postgres=# create user "noppression" with password 'a621c6144e5950838671fb2fa0064154';
postgres=#  create database "noppression_prod" owner "noppression"; 

### Database.yml file

default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
  host: localhost
  username: noppression
  password: a621c6144e5950838671fb2fa0064154

development:
  <<: *default
  database: noppression_dev


test:
  <<: *default
  database: noppression_test

production:
  <<: *default
  database: noppression_prod



### Finishing up

rake db:setup