require 'minitest/autorun'
require 'model/bill'
require 'model/category'

class TestBill < MiniTest::Test

  def test_referential_bill
    cat = Category.new(name: 'TestCat', type: :referential)
    cat.save
    bill = ReferentialBill.new()
    refute bill.valid?
    bill.meter = 100.0
    bill.category = cat
    assert bill.valid?
    assert bill.save
  end

end
