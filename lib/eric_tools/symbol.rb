class Symbol
  def to_logger
    self.to_s.to_logger
  end

  def to_debug
    self.to_s.to_debug
  end

  alias :to_info :to_logger
end