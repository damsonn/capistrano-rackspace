# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__) 
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib) 

Gem::Specification.new do |gem|
  gem.name = 'capistrano-rackspace'
  gem.version = '0.0.1'
  gem.date = '2015-03-09'
  gem.summary = 'Capistrano Rackspace Autoscale Helper'
  gem.description = 'If you use Rackspace Autoscale and want to find out which server'
  gem.authors = ["Chris Kruger"]
  gem.email = 'chris.kruger+rackspace_helper@mokosocialmedia.com'
  gem.license = 'MIT'

  gem.files = ["lib/rackspace.rb"]
  gem.require_paths = ["lib"]
end
