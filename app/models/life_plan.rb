class LifePlan
  attr_accessor :contribution, :contribute_years,
    :withdraw, :withdraw_after

  attr_reader :total_years

  def initialize(total_plan_years)
    @total_years = total_plan_years

    @contribution = 0
    @withdraw = 0

    @contribute_years = total_plan_years
    @withdraw_after = 0
  end

  def contribution_for(year_index)
    year_index < @contribute_years ? @contribution : 0
  end

  def withdraw_for(year_index)
    year_index >= @withdraw_after ? @withdraw : 0
  end
end
