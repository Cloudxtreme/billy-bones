require 'model/bill'
require 'spec_helper'

describe Bill do
  it 'should create something' do
    b = build(:bill)
    expect(b.valid?).to be true
  end
end
