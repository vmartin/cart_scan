require 'base_rule'
class PayOneGetXForFreeRule < BaseRule

  def initialize(x_for_free = 0)
    @x_for_free = x_for_free
 
  end

  def execute total_items, base_price
    (total_items.div(@x_for_free + 1)  * base_price) + (total_items.modulo(@x_for_free + 1) * base_price)    
  end

end
