require 'base_rule'
class ApplyDiscountRule < BaseRule

 
  def initialize(threshold_value = 0, parts = 1, total_parts = 1)
    @threshold_value = threshold_value
    @parts = parts
    @total_parts = total_parts
  end

  
  # total_items:  how many items are in cart 
  # base_price:   base_price of rule
  def execute(total_items, base_price)
    if total_items < @threshold_value
      total_items * base_price
    else
      total_items *  (@parts * (base_price / @total_parts))
    end
  end
 
end
