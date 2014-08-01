#encoding: utf-8
require 'data_mapper'

class Bill
  include DataMapper::Resource

  def template
    # Name of template that should be used to render the object
    nil
  end

  property :id, Serial
  property :type, Discriminator

  belongs_to :category

  def to_hash
    # Returns a hash containing all attributes
    # for view representation
    attrs = attributes
    attrs[:category] = category.name
    attrs
  end

end

class ReferentialBill < Bill
  # Referential bills only list the amount of resource (e.g. water,
  # electricity and such) consumed.
  property :meter, Float
  property :measure_date, Date
  validates_presence_of :meter, :measure_date

  def template
    :referential_bill
  end

end

class PredefinedBill < Bill
  # Predefined bills have a cost that doesn't depend on the amount of
  # resource consumed
  property :cost, Float
  property :pay_date, Date
  validates_presence_of :cost, :pay_date

  def template
    :predefined_bill
  end
end

class ComputableBill < Bill
  # Computable bills have a cost that depends on the amount of resource
  # consumed and a tariff. The cost should not be set manually,
  # but computed using the tariff, the meter value and the category's
  # modificators (if any).
  #belongs_to :tariff TODO uncomment when tariff ready
  property :cost, Float, writer: :private
  property :pay_date, Date
  property :measure_date, Date
  validates_presence_of :pay_date

  def template
    :computable_bill
  end
end
