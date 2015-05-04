class NilClass
  def to_logger
    'nil'.to_logger
  end

  def to_debug
    'nil'.to_debug
  end

  alias :to_info :to_logger
end