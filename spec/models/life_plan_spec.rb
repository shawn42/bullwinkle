require 'spec_helper'

describe LifePlan do

  describe "#contribution_for" do
    it "returns the contribution amount for the given year (index)" do
      plan = LifePlan.new(4)
      plan.contribution = 1_000
      plan.contribute_years = 3

      expect(plan.contribution_for(0)).to eq(1_000)
      expect(plan.contribution_for(1)).to eq(1_000)
      expect(plan.contribution_for(2)).to eq(1_000)
      expect(plan.contribution_for(3)).to eq(0)
    end
  end

  describe "#withdraw_for" do
    it "returns the withdraw amount for the given year (index)" do
      plan = LifePlan.new(4)
      plan.withdraw = 1_000
      plan.withdraw_after = 2

      expect(plan.withdraw_for(0)).to eq(0)
      expect(plan.withdraw_for(1)).to eq(0)
      expect(plan.withdraw_for(2)).to eq(1_000)
      expect(plan.withdraw_for(3)).to eq(1_000)
    end
  end

end
