require 'data_mapper'

# A model class representing tariffs
class Tariff
  include DataMapper::Resource

  property :id, Serial
  property :approval_date, Date, required: true
  property :price, Float, required: true

  belongs_to :category
end
