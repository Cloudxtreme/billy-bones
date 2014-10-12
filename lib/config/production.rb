DataMapper::Logger.new('db.log', :info)
DataMapper.setup(:default,
                 'postgres://billy-bones:billy@localhost/billy-bones')
DataMapper.finalize
Environment.logger = Logger.new('app.log', :info)
