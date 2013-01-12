require 'spec_helper'

describe Investment do

  it "takes an annual yield and standard deviation" do
    i = Investment.new 0.10, 1

    expect(i.annual_yield).to eq(0.10)
    expect(i.std_dev).to eq(1)
  end

  it "can return the std_dev in percentage points for normal distributions" do
    i = Investment.new 0.10, 1
    expect(i.std_dev_as_percentage).to eq(0.01)
  end

end
