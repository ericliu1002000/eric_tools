class DateTime
  def chinese_format
    self.strftime("%Y-%-m-%-d %H:%M:%S")
  end

  def chinese_format_day
    self.strftime("%Y-%-m-%-d")
  end
end