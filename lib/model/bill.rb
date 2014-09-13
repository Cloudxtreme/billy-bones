#encoding: utf-8
require 'data_mapper'

class Bill
  include DataMapper::Resource

  property :id, Serial
  property :meter, Float
  property :cost, Float
  property :date, Date
  property :period, Date

  belongs_to :category

end
