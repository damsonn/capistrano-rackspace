# Capistrano::Rackspace 

A Capistrano 3.x plugin that provides dynamic configuration via the Rackspace API 

## Installation 

    gem 'capistrano-rackspace'
    gem 'capistrano'

And then execute 
    
    bundle install

## Usage 

Require in `Capfile` to use

```ruby
require 'capistrano/rackspace'
```

You can then use the Rackspace functionality in the deploy/environment files 

```ruby 
Rackspace::Configuration.username = 'substitute.rackspace.username'
Rackspace::Configuration.api_key = 'substitute.rackspace.api.key'
Rackspace::Configuration.region = :ord
Rackspace::Configuration.autoscale_group = "AUTOSCALE-GROUP-NAME"

autoscale = Rackspace::AutoScale.new

role :app, %w{deploy@standalone-server} + autoscale.addresses
role :web, %w{deploy@standalone-server} + autoscale.addresses
role :db,  %w{deploy@standalone-server}
```

