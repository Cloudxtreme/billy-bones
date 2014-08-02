require 'data_mapper'
require 'dm-types'

class Type
	include DataMapper::Resource

	property :id, Serial
	property :name, String, required: true
	property :tariff_required, Boolean, default: false
	property :required_fields, CommaSeparatedList, default: []
	property :computations, Yaml, default: {}

	has n, :categories
	has n, :bills, through: :categories
end
