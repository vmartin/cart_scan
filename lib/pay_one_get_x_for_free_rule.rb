require 'base_rule'
class PayOneGetXForFreeRule < BaseRule

  # x_for_free_value: integer that represents how many items for free
  # you will get for each one payed
  def initialize(x_for_free = 0)
    @x_for_free = x_for_free
  end

  # total_items:  how many items was in cart 
  # base_price:   base_price of rule
  def execute(total_items, base_price)
    rest = total_items.modulo(@x_for_free + 1)
    (total_items.div(@x_for_free + 1)  * base_price) + (  ( rest != 0 ? 1 : 0)  * base_price)    
  end

end
