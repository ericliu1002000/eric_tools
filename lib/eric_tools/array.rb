class Array
  def to_logger
    self.each { |item|
      ((item||'').to_s).to_logger
    }
  end

  def to_debug
    self.each { |item|
      ((item||'').to_s).to_debug
    }
  end

  alias :to_info :to_logger
end