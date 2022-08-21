require 'base_rule'
class PayOneGetXForFreeRule < BaseRule

  def initialize(x_for_free = 0)
    @x_for_free = x_for_free
  end

end
