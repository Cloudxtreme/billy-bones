#!/usr/bin/env ruby
$LOAD_PATH << 'lib'

require 'config'
require 'active_support/all'

# Wipe all data
DataMapper.auto_migrate!

# If development, seed dev data
if settings.development?
	tref = Type.create(name: 'referential', required_fields: %w{date meter})
	tpr = Type.create(name: 'predefined', required_fields: %w{date cost})
	tcmp = Type.create(name: 'computational', required_fields: %w{date meter},
		tariff_required: true,
		computations: {
			'cost' => 'category.current_price * ' +
				'(meter - (category.current_meter or category.init_meter))'
			})

	cat1 = Category.create(name: "TestCat1", type: tref)
	cat2 = Category.create(name: "TestCat2", type: tpr)
	cat3 = Category.create(name: "TestCat3", init_meter: 200, type: tcmp)

	trf = Tariff.create(approval_date: Time.now, category: cat3, price: 10.0)

	b1 = Bill.create(date: 10.days.ago, meter: 1000, category: cat1)
	b2 = Bill.create(date: 12.days.ago, cost: 1400, category: cat2)
	b3 = Bill.create(date: 4.days.ago, meter: 1100, category: cat3)
end
