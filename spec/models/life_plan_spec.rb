require 'spec_helper'

describe LifePlan do

  describe "#contribution_for" do
    it "returns the contribution amount for the given year (index)" do
      plan = LifePlan.new
      plan.contribution = 1_000
      plan.contribute_years = 3

      expect(plan.contribution_for(0)).to eq(1_000)
      expect(plan.contribution_for(1)).to eq(1_000)
      expect(plan.contribution_for(2)).to eq(1_000)
      expect(plan.contribution_for(3)).to eq(0)
    end
  end

end
