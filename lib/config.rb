# Configuration files and app-wide requires go here

require 'sinatra'
require 'data_mapper'
require 'model/bill'
require 'model/category'
require 'model/tariff'
require 'environment'
require 'logger'
configure :production do
  DataMapper::Logger.new('db.log', :info)
  DataMapper.setup(:default,
                   'postgres://billy-bones:billy@localhost/billy-bones')
  DataMapper.finalize
  Environment.logger = Logger.new('app.log', :info)
end

configure :development do
  DataMapper::Logger.new($stderr, :debug)
  DataMapper.setup(:default,
                   'postgres://billy-bones:billy@localhost/billy-bones-dev')
  DataMapper.finalize
  DataMapper.auto_upgrade!
  Environment.logger = Logger.new($stderr, :debug)
end

configure :test do
  require 'dm_migrations'
  DataMapper::Logger.new($stderr, :debug)
  DataMapper.setup(:default,
                   'postgres://billy-bones:billy@localhost/billy-bones-test')
  DataMapper.finalize
  DataMapper.auto_migrate!
  Environment.logger = Logger.new($stderr, :debug)
end
