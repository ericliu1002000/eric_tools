class Date
  def chinese_format
    self.strftime("%Y-%-m-%-d 00:00:00")
  end

  def chinese_format_day
    self.strftime("%Y-%-m-%-d")
  end

  def chinese_week_day
    cwdays = %w{星期一 星期二 星期三 星期四 星期五 星期六 星期日}
    cwdays[self.cwday-1]
  end
end