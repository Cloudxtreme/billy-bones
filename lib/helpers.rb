# A module holding various helpers
module Helpers
  class << self
    def update_params(model, params)
      params.except { |_, v| v.blank? }.each do |key, value|
        model.attribute_set key, value
      end
      model.save
    end
  end
end
