require 'data_mapper'

class Bill
  include DataMapper::Resource

  property :id, Serial
  property :value, Float
  property :cost, Float

end

Bill.finalize
