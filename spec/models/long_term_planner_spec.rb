require 'spec_helper'

describe LongTermPlanner do

  it "calculates next year's balance from widthdraws and contributions" do
    planner = LongTermPlanner.new 1_000, 1_000, 500
    expect(planner.calculate_next_year).to eq(1_500)
  end

  it "can take a portfolio of investments into account when calculating" do
    portfolio = Portfolio.new
    portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

    planner = LongTermPlanner.new 1_000, 0, 0
    planner.portfolio = portfolio

    # + 10% of the 1_000 + std_dev
    expect(planner.calculate_next_year).to be > 1_000
    expect(planner.calculate_next_year).to be < 1_200
  end

end
