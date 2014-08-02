# Configuration files and app-wide requires go here

require 'sinatra'
require 'data_mapper'
require 'model/type'
require 'model/bill'
require 'model/category'
require 'model/tariff'
configure :production do
  DataMapper::Logger.new('db-log', :debug)
  DataMapper.setup(:default,
    'postgres://billy-bones:billy@localhost/billy-bones')
  DataMapper.finalize
end

configure :development do
  DataMapper::Logger.new($stderr, :debug)
  DataMapper.setup(:default,
    'postgres://billy-bones:billy@localhost/billy-bones-dev')
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

configure :test do
  require 'dm_migrations'
  DataMapper::Logger.new($stderr, :debug)
  DataMapper.setup(:default,
    'postgres://billy-bones:billy@localhost/billy-bones-test')
  DataMapper.finalize
  DataMapper.auto_migrate!
end
