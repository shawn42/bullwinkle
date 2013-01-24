class LongTermPlannerController < ApplicationController

  def index
  end

  def next_year
    @planner = build_planner
    @planner_results = @planner.calculate_next_year

    render :index
  end

  def over_time
    @planner = build_planner
    @planner_results = @planner.calculate_next_years(params[:years_to_calculate].to_i)
  end

  protected

  def build_planner
    planner = LongTermPlanner.new(
      params[:balance].to_i,
      params[:contributions].to_i,
      params[:withdraws].to_i
    )
    portfolio = Portfolio.new

    if params[:investment]
      investment = Investment.new params[:investment][:annual_yield].to_f,
        params[:investment][:std_dev].to_f

      portfolio.add_investment_at_allocation investment, 1
    end

    if params[:inflation]
      investment = Investment.new -params[:inflation][:annual_yield].to_f,
        params[:inflation][:std_dev].to_f

      portfolio.add_investment_at_allocation investment, 1
    end

    planner.portfolio = portfolio
    planner
  end

end
