require 'data_mapper'
require 'active_support/inflector'

class Category
    include DataMapper::Resource

    property :id, Serial
    property :name, String

    has n, :tariffs
    has n, :bills
    belongs_to :type

    def bill_template(action)
      "_#{type.name.downcase}_#{action}"
    end

end
