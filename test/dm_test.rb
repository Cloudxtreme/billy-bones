require 'data_mapper'
DataMapper.setup(:default,
  'postgres://billy-bones:billy@localhost/billy-bones-test')
DataMapper::Logger.new($stdout, :debug)