class LongTermPlanner

  attr_accessor :portfolio, :contribution_period_ends

  def initialize(current_balance)
    @current_balance = current_balance
  end

  def calculate_next_year(contribution = 0, withdraw = 0)
    action = CalculateOneYear.new
    action.balance      = @current_balance
    action.contribution = contribution
    action.withdraw     = withdraw

    action.run @portfolio
  end

  # calculation window
  # contributing years
  # Withdraw years
  # contributing amount
  # withdraw amount
  def calculate_next_years(years_ahead)
    results = []

    years_ahead.times do |year_count|
      @current_year = year_count

      year_results = calculate_next_year()
      @current_balance = year_results.average
      results << year_results
    end

    results
  end

  protected

  def contributing?
    @current_year < @contribution_period_ends
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
