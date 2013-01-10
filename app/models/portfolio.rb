class Portfolio

  def initialize
    @investments = []
  end

  def add_investment_at_allocation(investment, allocation)
    @investments << [investment, allocation]
  end

  def each_investment(&block)
    @investments.each do |(investment, allocation)|
      block.call investment, allocation
    end
  end

end
