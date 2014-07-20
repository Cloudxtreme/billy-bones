require 'model/bill'
require 'model_helper'

class TestBill < MiniTest::Test

  def test_that_valid_bill_will_be_saved
    b = Bill.new(meter: nil, cost: 100.0, date_paid: Time.now)
    assert b.valid?
    assert b.save
    b.meter = 10500
    assert b.valid?
    assert b.save
  end

end
