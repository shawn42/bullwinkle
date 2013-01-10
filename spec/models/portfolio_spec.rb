require 'spec_helper'

describe Portfolio do

  it "can be given an investment at a given allocation" do
    portfolio = Portfolio.new
    investment = Investment.new 1, 1
    portfolio.add_investment_at_allocation investment, 1

    portfolio.each_investment do |i, allocation|
      expect(i).to eq(investment)
      expect(allocation).to eq(1)
    end
  end

end
