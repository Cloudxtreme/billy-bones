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

  before :save do
    category.type.computations.each do |name, code|
      attribute_set(name.to_sym, eval(code))
    end
    true
  end

end
