require 'data_mapper'
DataMapper::Logger.new($stderr, :debug)
DataMapper.setup(:default,
  'postgres://billy-bones:billy@localhost/billy-bones-test')

require 'minitest/autorun'
require 'dm-migrations'
DataMapper.auto_migrate!
