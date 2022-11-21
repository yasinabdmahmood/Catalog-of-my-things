class TimeDiff
  def years(t_string)
    total_days = (Date.today - t_string).to_i
    (total_days/365).to_i
  end

  def days(t_string)
    total_days = (Date.today - t_string).to_i
  end

  def months(t_string)
    total_days = (Date.today - t_string).to_i
    (total_days/30).to_i
  end
end