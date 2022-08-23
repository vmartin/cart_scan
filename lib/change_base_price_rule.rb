require 'base_rule'
class ChangeBasePriceRule < BaseRule

  # threshold_value : determines the threshold value from which the price change is applied (inclusive)
  # new_price: the price that rule use if is need for execution method
  def initialize(threshold_value = 0, new_price = 0 )
    @threshold_value = threshold_value
    @new_price = BigDecimal(new_price)
  end

  # - Change base price calculation
  #  
  # total_items: number of scanned products for a concret product_code
  # base_price:  price without discounts for a concret product_code
  #
  # how do it:   if total_items >= @threshold_value it use @new_price to do calculation
  #              else use base_price
  def execute(total_items, base_price)
    if total_items < @threshold_value
      total_items * base_price
    else
      total_items * @new_price
    end
  end

end
