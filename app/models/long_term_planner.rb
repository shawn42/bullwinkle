class LongTermPlanner

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
