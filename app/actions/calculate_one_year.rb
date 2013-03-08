class CalculateOneYear

  SIMULATION_LENGTH = 1_000

  PlannerResults = Struct.new(:average, :top_70, :top_90)

  attr_accessor :balance, :contribution, :withdraw

  def initialize
    @random = SimpleRandom.new
  end

  def run(portfolio = nil)
    @portfolio = portfolio
    @current_balance = @balance

    sim_results = sim_one_year

    PlannerResults.new(
      average_results(sim_results),
      top_result_at_percentage(sim_results, 0.7),
      top_result_at_percentage(sim_results, 0.9)
    )
  end

  protected

  def sim_one_year
    sim_count = 0
    sim_results = []
    @random.set_seed Time.now

    SIMULATION_LENGTH.times do
      sim_results << calculate_new_balance_from_portfolio + @contribution - @withdraw
    end

    sim_results
  end

  def calculate_new_balance_from_portfolio
    return @current_balance unless @portfolio
    new_balance = @current_balance

    @portfolio.each_investment do |investment, allocation|
      new_balance += sample_investment(investment) * new_balance * allocation
    end

    new_balance
  end

  def sample_investment(investment)
    @random.normal(investment.annual_yield, investment.std_dev_as_percentage)
  end

  def average_results(results)
    results.inject(0) {|memo, result| memo += result } / results.size.to_f
  end

  def top_result_at_percentage(results, top_percentage)
    results.sort[
      ((results.size * top_percentage) - 1).to_i
    ].to_i
  end

end
