class Time
  def chinese_format
    self.strftime("%Y-%-m-%-d %H:%M:%S")
  end

  def chinese_format_day
    self.strftime("%Y-%-m-%-d")
  end

  def chinese_week_day
    self.to_date.chinese_week_day
  end
end