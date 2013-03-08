require 'spec_helper'

describe LongTermPlanner do

  describe "#calculate_next_year" do
    it "calculates one year from the given inputs" do
      portfolio = Portfolio.new
      portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

      planner = LongTermPlanner.new 1_000
      planner.portfolio = portfolio

      results = planner.calculate_next_year(1_000, 500)

      expect(results.average).to be > 1_500
      expect(results.average).to be < 1_700
    end
  end

  describe "#calculate_next_years" do
    it "calculates over a period of years" do
      portfolio = Portfolio.new
      portfolio.add_investment_at_allocation Investment.new(0.10, 1), 1.0

      planner = LongTermPlanner.new 1_000
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

    it "stops contributions after a set number of years" do
      planner = LongTermPlanner.new 1_000
      planner.contribution_period_ends = 2

      life_plan = LifePlan.new
      life_plan.contribution = 1_000
      life_plan.contribute_years = 2

      results = planner.calculate_next_years(4, life_plan)

      expect(results.length).to eq(4)

      expect(results[0].average.to_i).to eq(2_000)
      expect(results[1].average.to_i).to eq(3_000)
      expect(results[2].average.to_i).to be(3_000)
      expect(results[3].average.to_i).to be(3_000)
    end
  end
end
