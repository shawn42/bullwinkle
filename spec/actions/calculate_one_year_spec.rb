require 'spec_helper'

describe CalculateOneYear do
  before do
    @action = CalculateOneYear.new
    @action.balance = 1_000
    @action.contribution = 1_000
    @action.withdraw = 500
  end

  it "calculates next year's balance from widthdraws and contributions" do
    expect(@action.run.average).to eq(1_500)
  end

  it "can take a portfolio of investments into account when calculating" do
    portfolio = Portfolio.new
    portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

    results = @action.run(portfolio)

    # 1_000 + 10%, + 1_000 - 500 (plus RANDOMNESS)
    expect(results.average).to be > 1_500
    expect(results.average).to be < 1_700
  end

  it "returns object containing top 70% interval" do
    portfolio = Portfolio.new
    portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

    top_70 = @action.run(portfolio).top_70

    expect(top_70).to be > 1_600
    expect(top_70).to be < 1_610
  end

  it "returns object containing top 90% interval" do
    portfolio = Portfolio.new
    portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

    top_90 = @action.run(portfolio).top_90

    expect(top_90).to be > 1_610
    expect(top_90).to be < 1_615
  end
end
