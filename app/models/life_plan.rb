class LifePlan
  attr_accessor :contribution, :contribute_years

  def initialize
    @contribution = 0
    @contribute_years = 0
  end

  def contribution_for(year_index)
    year_index < @contribute_years ? @contribution : 0
  end
end
