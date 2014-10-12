#!/usr/bin/env ruby
# Require the libraries
require 'requires'

# Dynamically require models
Dir[File.join('lib', 'model', '*.rb')].each do |f|
  require File.join('model', File.basename(f))
end

# Application class
class BillyBones < Sinatra::Base
  configure do
    set :root, File.dirname(settings.root)
    require File.join('config', settings.environment.to_s)
  end
end

#Dynamically require controllers
Dir[File.join('lib', 'controller', '*.rb')].each do |f|
  require File.join('controller', File.basename(f))
end
