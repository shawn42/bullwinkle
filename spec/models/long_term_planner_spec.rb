require 'spec_helper'

describe LongTermPlanner do

  describe "#calculate_next_year" do
    it "calculates next year's balance from widthdraws and contributions" do
      planner = LongTermPlanner.new 1_000, 1_000, 500
      expect(planner.calculate_next_year.average).to eq(1_500)
    end

    it "can take a portfolio of investments into account when calculating" do
      portfolio = Portfolio.new
      portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

      planner = LongTermPlanner.new 1_000, 0, 0
      planner.portfolio = portfolio
      average_balance = planner.calculate_next_year.average

      # + 10% of the 1_000 + std_dev
      expect(average_balance).to be > 1_000
      expect(average_balance).to be < 1_200
    end

    it "returns object containing top 70% interval" do
      portfolio = Portfolio.new
      portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

      planner = LongTermPlanner.new 1_000, 0, 0
      planner.portfolio = portfolio

      top_70 = planner.calculate_next_year.top_70

      expect(top_70).to be > 1_100
      expect(top_70).to be < 1_110
    end

    it "returns object containing top 90% interval" do
      portfolio = Portfolio.new
      portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

      planner = LongTermPlanner.new 1_000, 0, 0
      planner.portfolio = portfolio

      top_90 = planner.calculate_next_year.top_90

      expect(top_90).to be > 1_110
      expect(top_90).to be < 1_115
    end
  end

  describe "#calculate_next_years" do
    it "calculates over a period of years" do
      portfolio = Portfolio.new
      portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

      planner = LongTermPlanner.new 1_000, 0, 0
      planner.portfolio = portfolio

      results = planner.calculate_next_years(3)

      expect(results.length).to eq(3)

      expect(results[0].average).to be > 1_000
      expect(results[0].average).to be < 1_200

      expect(results[1].average).to be > 1_100
      expect(results[1].average).to be < 1_300

      expect(results[2].average).to be > 1_200
      expect(results[2].average).to be < 1_400
    end
  end
end
