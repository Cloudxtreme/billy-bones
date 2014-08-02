#encoding: utf-8
require 'data_mapper'

class Bill
  include DataMapper::Resource

  property :id, Serial
  property :meter, Float
  property :cost, Float
  property :date, Date

  belongs_to :category

  validates_with_block do
    category.type.required_fields.all?{|f| not self.send(f).nil?}
  end

  before :save do
    category.type.computations.each do |name, code|
      attribute_set(name.to_sym, eval(code))
    end
    true
  end

  def to_hash
    # Returns a hash containing all attributes
    # for view representation
    attrs = attributes
    attrs[:category] = category.name
    attrs
  end

end
