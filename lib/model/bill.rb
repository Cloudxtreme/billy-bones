#encoding: utf-8
require 'data_mapper'

class Bill
  include DataMapper::Resource

  property :id, Serial
  property :meter, Float
  property :cost, Float
  property :measure_date, Date
  property :pay_date, Date

  belongs_to :category
  has 1, :type, through: :category

  validates_with_block do
    type.required_fields.all?{|f| not self.send(f).nil?}
  end

  def to_hash
    # Returns a hash containing all attributes
    # for view representation
    attrs = attributes
    attrs[:category] = category.name
    attrs
  end

end
