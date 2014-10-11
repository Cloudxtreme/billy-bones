require 'data_mapper'

# A model class representing the bills
class Bill
  include DataMapper::Resource

  property :id, Serial
  property :meter, Float
  property :cost, Float
  property :date, Date, required: true
  property :period, Date, required: true

  belongs_to :category
end
