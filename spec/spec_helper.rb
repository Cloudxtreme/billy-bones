require 'config'
require 'factory_girl'
require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions
end
