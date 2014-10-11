require 'rake/testtask'

lib_dir = File.expand_path 'lib'
test_dir = File.expand_path 'test'

task :testenv do
  ENV['RACK_ENV'] = 'test'
end

Rake::TestTask.new('test' => :testenv) do |t|
  t.libs = [lib_dir, test_dir]
  t.pattern = 'test/**/test_*.rb'
end

desc 'Run app'
task run: :test do
  # TODO: Write actual running code here
end
