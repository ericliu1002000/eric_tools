class String
  def to_logger
    ApplicationController.logger.info self
    ApplicationController.logger.info "\n"
  end

  def to_debug
    ApplicationController.logger.debug self
    ApplicationController.logger.debug "\n"
  end

  alias :to_info :to_logger

  def show_simple_with_points
    return '' if self.blank?
    max = 10
    introduce = self[0, max]
    introduce += '...' if self.size > max
    introduce
  end

  alias :simple :show_simple_with_points
end