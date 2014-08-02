require 'data_mapper'

class Tariff
  include DataMapper::Resource

  property :id, Serial
  property :approval_date, Date, required: true
  property :cost, Float, required: true

  belongs_to :category

end
