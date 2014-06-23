DataMapper::Logger.new $stderr, :debug
DataMapper.setup :default, 'postgres://billy:billy@localhost/test-billy-bones'
