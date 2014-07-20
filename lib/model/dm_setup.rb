require 'data_mapper'
configure :production do
  DataMapper::Logger.new('db-log', :debug)
  DataMapper.setup(:default,
    'postgres://billy-bones:billy@localhost/billy-bones')
end

configure :development do
  DataMapper::Logger.new($stderr, :debug)
  DataMapper.setup(:default,
    'postgres://billy-bones:billy@localhost/billy-bones-dev')
  DataMapper.auto_upgrade!
end
