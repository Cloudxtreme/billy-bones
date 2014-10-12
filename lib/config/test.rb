require 'dm_migrations'
DataMapper::Logger.new($stderr, :debug)
DataMapper.setup(:default,
                 'postgres://billy-bones:billy@localhost/billy-bones-test')
DataMapper.finalize
DataMapper.auto_migrate!
Environment.logger = Logger.new($stderr, :debug)
