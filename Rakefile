require 'rake/testtask'

lib_dir = File.expand_path 'lib'
test_dir = File.expand_path 'test'

task :environ do
  $LOAD_PATH << 'lib'
  ENV['RACK_ENV'] ||= 'development'
end

task :testenv do
  ENV['RACK_ENV'] = 'test'
end

Rake::TestTask.new('test' => :testenv) do |t|
  t.libs = [lib_dir, test_dir]
  t.pattern = 'test/**/test_*.rb'
end

desc 'Run app'
task run: :environ do
  require 'billy_bones'
  BillyBones.run!
end

desc 'Developer console'
task console: :environ do
  require 'billy_bones'  
  require 'pry'
  binding.pry
end

desc "Seed database"
task seed: :environ do
  require 'billy_bones'
  require 'active_support/all'
  require 'faker'
  
  DataMapper.finalize
  # Wipe all data
  DataMapper.auto_migrate!
  
  # If development, seed dev data
  cat1 = Category.create(name: Faker::Company.name)
  cat2 = Category.create(name: Faker::Company.name, init_meter: 1100.0)
  cat3 = Category.create(name: Faker::Company.name, init_meter: 200.0)
  
  Tariff.create(approval_date: Time.now, category: cat3, price: 10.0)
  
  Bill.create(date: 10.days.ago,  period: 10.days.ago, meter: 1000, category: cat1)
  Bill.create(date: 12.days.ago,  period: 1.month.ago, cost: 1400, category: cat2)
  Bill.create(date: 4.days.ago, period: 5.days.ago, meter: 1100, category: cat3)
end
