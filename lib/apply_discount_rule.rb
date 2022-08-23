require 'base_rule'
class ApplyDiscountRule < BaseRule

  # threshold_value : determines the threshold value from which the price change is applied (inclusive)
  # parts: in the context of the x/y from BasePrice , this param is x
  # total_parts: in the context of the x/y from BasePrice , this param is y
  def initialize(threshold_value = 0, parts = 1, total_parts = 1)
    @threshold_value = threshold_value
    @parts = parts
    @total_parts = total_parts
  end

  # - Applay discount calculation
  # total_items: number of scanned products for a concret product_code
  # base_price:  price without discounts for a concret product_code
  #
  # how do it:   if total_items >= [@threshold_value] it takes [@parts] of [base_price/@total_parts] 
  #              to do calculation
  #              else use base_price
  def execute(total_items, base_price)
    if total_items < @threshold_value
      total_items * base_price
    else
      total_items *  (@parts * (base_price / @total_parts))
    end
  end
 
end
