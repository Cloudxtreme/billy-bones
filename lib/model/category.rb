require 'data_mapper'
require 'active_support/inflector'

class Category
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :init_meter, Float, default: 0 # Initial meter value

    has n, :tariffs
    has n, :bills

end
