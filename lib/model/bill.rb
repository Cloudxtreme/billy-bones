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

end

class ReferentialBill < Bill
    # Referential bills only list the amount of resource (e.g. water,
    # electricity and such) consumed.
    property :meter, Float, required: true

    def template
        'referential_bill'
    end
end

class PredefinedBill < Bill
    # Predefined bills have a cost that doesn't depend on the amount of
    # resource consumed
    property :cost, Float, required: true

    def template
        'predefined_bill'
    end
end

class ComputableBill < ReferentialBill
    # Computable bills have a cost that depends on the amount of resource
    # consumed and a tariff. The cost should not be set manually,
    # but computed using the tariff, the meter value and the modificators
    # (if any).
    #belongs_to :tariff TODO uncomment when tariff ready
    property :cost, Float, writer: :private
    property :modificators, Json, default: '[]'
end

