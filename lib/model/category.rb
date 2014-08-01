require 'data_mapper'
require 'active_support/inflector'

class Category
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :cat_type, Discriminator

    # has n, :tariffs TODO uncomment when tariff ready

    def create_bill(params)
      # A bill factory for current category type
      new_bill = eval("#{self.class.bill_type}").new(params)
      new_bill.category = self
      new_bill
    end

    def self.bill_template(name)
      "_#{bill_type.underscore}_#{name}"
    end

end

%w{Referential Predefined Computable}.each do |bill_type|
  eval %{
    class #{bill_type}Category < Category
      def self.bill_type
        '#{bill_type}Bill'
      end

      has n, :#{bill_type.downcase}_bills, child_key: [:category_id]

      alias :bills :#{bill_type.downcase}_bills

    end
  }
end
