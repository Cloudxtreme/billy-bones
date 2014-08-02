require 'data_mapper'
require 'active_support/inflector'

class Category
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :init_meter, Float, default: 0 # Initial meter value

    has n, :tariffs
    has n, :bills
    belongs_to :type

    def bill_template(action)
      "_#{type.name.downcase}_#{action}"
    end

    def current_price
      ct = tariffs(order: [:approval_date.desc]).first
      if ct
        ct.price
      else
        nil
      end
    end

    def current_meter
      cm = bills(order: [:date.desc]).first
      if cm
        cm.meter
      else
        nil
      end
    end
end
