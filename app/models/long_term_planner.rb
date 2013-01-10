class LongTermPlanner

  SIMULATION_LENGTH = 1_000

  attr_accessor :portfolio

  def initialize(current_balance, contributions, withdraws)
    @current_balance = current_balance
    @contributions = contributions
    @withdraws = withdraws

    @random = SimpleRandom.new
  end

  def calculate_next_year
    sim_count = 0
    sim_results = []
    @random.set_seed Time.now

    SIMULATION_LENGTH.times do
      sim_results << balance_after_portfolios + @contributions - @withdraws
    end

    average_results(sim_results)
  end

  protected

  def balance_after_portfolios
    return @current_balance unless @portfolio
    new_balance = @current_balance

    @portfolio.each_investment do |investment, allocation|
      new_balance += sample_investment(investment) * new_balance * allocation
    end

    new_balance
  end

  def sample_investment(investment)
    @random.normal(investment.annual_yield, investment.std_dev_in_percentage_points)
  end

  def average_results(results)
    results.inject(0) {|memo, result| memo += result } / results.size.to_f
  end

  # Inputs
  #  - Starting Principle (previous year's balance)
  #  - Investments (picked by Risk)
  #  - Contributions
  #    - deferred
  #    - exempt
  #    - taxable
  #  - Start year
  #  - Contribution year count
  #  - Withdraw year count
  #  - Withdraw amount / year
  #
  # Options
  #  - Number of simulations to run
  #  - Year to calculate
  #  - Year range to calculate

  # Algorithm
  #
  # Pre calc:
  #  - Years contributing
  #  - Years withdrawing
  #  - Amount contributing per year
  #  - Amount withdrawing per year
  #
  # For each simulation run:
  #  For each Portfolio:
  #   - Calculate possible gain for that year according to portfolio allocation
  #     - Annual yield * balance * allocation / std_dev
  #
  #  Then:
  #   - Add up gain with balance to get current balance
  #   - Add gain to current balance
  #   - Add contribution of that year to balance
  #   - Remove withdraws of that year from balance
  #   - Handle Inflation as a withdraw
  #   - Store result
  #
  # Average resulting values for the year:
  #  - Get the average
  #  - Get the 70%
  #  - Get the 90%
  #

  # Returns
  #  - Ninety Percent Amount
  #  - Seventy Percent Amount
  #  - Average (50%) Amount
  #
  #  - Input parameters(?):
  #    - age
  #    - retirement age
  #    - death age
end
