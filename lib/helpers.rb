module Helpers

  class << self

    def update_params(model, params)
      params.each do |key, value|
        model.attribute_set key, value
      end
      model.save
    end
  end

end
