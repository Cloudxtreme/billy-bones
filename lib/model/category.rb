require 'data_mapper'

class Category
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :type, Enum[:referential, :predefined, :computable]

    has n, :bills
    # has n, :tariffs TODO uncomment when tariff ready

    def create_bill(params)
      # A bill factory for current category type
      case type
      when :referential
        ReferentialBill.new params
      when :predefined
        PredefinedBill.new params
      when :computable
        ComputableBill.new params
      end
    end

end
