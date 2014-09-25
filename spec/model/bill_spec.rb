require 'model/bill'
require 'spec_helper'

describe Bill do
  it 'should be not valid by default' do
    b = build(:bill)
    expect(b.valid?).to be false
  end

  it 'should have date and period' do
    b = build(:bill, :with_date, :with_period)
    expect(b.valid?).to be true
    b = build(:bill)
    b.date = "Totally not a date"
    b.period = "Totally not a period"
    expect(b.valid?).to be false
  end

end
