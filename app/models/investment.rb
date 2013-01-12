class Investment < Struct.new(:annual_yield, :std_dev)

  # Investment#std_dev is entered and stored as percentage points and thus
  # a number > 1. We need to convert that to a raw percentage for some calculations
  def std_dev_as_percentage
    std_dev / 100.0
  end

end
