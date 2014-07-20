require 'data_mapper'

class Bill
  include DataMapper::Resource

  property :id, Serial
  property :meter, Float
  property :cost, Float
  property :date_paid, Date

end

Bill.finalize
