class LongTermPlannerController < ApplicationController

  def index
  end

  def next_year
    @planner = build_planner
    @planner_results = @planner.calculate_next_year(
      params[:contributions].to_i,
      params[:withdraws].to_i
    )

    render :index
  end

  def over_time
    @planner = build_planner

    life_plan = LifePlan.new(params[:years_to_calculate].to_i)

    life_plan.contribution     = params[:contributions].to_i if params[:contributions]
    life_plan.contribute_years = params[:stop_contributions_after_year].to_i if params[:stop_contributions_after_year]
    life_plan.withdraw         = params[:withdraws].to_i if params[:withdraws]
    life_plan.withdraw_after   = params[:withdraw_after_year].to_i if params[:withdraw_after_year]

    @planner_results = @planner.calculate_life_plan(life_plan)
  end

  protected

  def build_planner
    planner = LongTermPlanner.new(params[:balance].to_i)
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
