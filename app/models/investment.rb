class Investment < Struct.new(:annual_yield, :std_dev)

  def std_dev_in_percentage_points
    std_dev / 100.0
  end

end
