DataMapper::Logger.new($stderr, :debug)
DataMapper.setup(:default,
                 'postgres://billy-bones:billy@localhost/billy-bones-dev')
DataMapper.finalize
DataMapper.auto_upgrade!
Environment.logger = Logger.new($stderr, :debug)
