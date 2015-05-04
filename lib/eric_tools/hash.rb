class Hash
  def to_logger
    self.each_pair { |k, v|
      info1 = ''
      info1 << ((k||'').to_s rescue '') <<":" << ((v||'').to_s rescue '') << "\n"
      ApplicationController.logger.info info1
    }
  end

  def to_debug
    self.each_pair { |k, v|
      info1 = ''
      info1 << ((k||'').to_s rescue '') <<":" << ((v||'').to_s rescue '') << "\n"
      ApplicationController.logger.debug info1
    }
  end

  alias :to_info :to_logger
end