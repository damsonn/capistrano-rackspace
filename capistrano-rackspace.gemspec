# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name = 'capistrano-rackspace'
  gem.version = '0.0.6'
  gem.date = '2015-03-09'
  gem.summary = 'Capistrano Rackspace Autoscale Helper'
  gem.description = 'If you use Rackspace Autoscale and want to find out which server'
  gem.authors = ['Chris Kruger', 'Damien Dormal']
  gem.email = ['chris.kruger+gemname@krugerheavyindustries.com', 'dormal.damien@gmail.com']
  gem.homepage = 'https://github.com/damsonn/capistrano-rackspace'
  gem.license = 'MIT'

  gem.files = `git ls-files`.split($/)
  gem.require_paths = ['lib']

  gem.add_dependency 'fog', '>= 1.32.0'
end
