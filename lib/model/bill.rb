require 'data_mapper'

class Bill
  include DataMapper::Resource

  property :id, Serial

end

Bill.finalize
