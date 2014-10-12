# A module holding various helpers
require 'active_support/core_ext/object/blank'
module Helpers
  class << self
    def update_params(model, params)
      params.reject{ |_, v| v.blank? }.each do |key, value|
        model.attribute_set key, value
      end
      model.save
    end
  end
end
