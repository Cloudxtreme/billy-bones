require 'data_mapper'

class Tariff
  include DataMapper::Resource
  
  property :id, Serial

end

Tariff.finalize!
