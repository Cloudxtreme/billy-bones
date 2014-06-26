require 'dm_test'
require 'minitest/autorun'

require 'model/bill.rb'
require 'dm-migrations'

DataMapper.auto_migrate!

class TestBill < MiniTest::Unit::TestCase

  def test_save_valid_bill
    b = Bill.new(value: nil, cost: 100.0)
    assert b.save
  end

end
