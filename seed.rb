#!/usr/bin/env ruby
$LOAD_PATH << 'lib'

require 'config'
require 'active_support/all'
require 'faker'

# Wipe all data
DataMapper.auto_migrate!

# If development, seed dev data
if settings.development?
	cat1 = Category.create(name: Faker::Company.name)
	cat2 = Category.create(name: Faker::Company.name, init_meter: 1100)
	cat3 = Category.create(name: Faker::Company.name, init_meter: 200)

	Tariff.create(approval_date: Time.now, category: cat3, price: 10.0)

	Bill.create(date: 10.days.ago, meter: 1000, category: cat1)
	Bill.create(date: 12.days.ago, cost: 1400, category: cat2)
	Bill.create(date: 4.days.ago, meter: 1100, category: cat3)
end
