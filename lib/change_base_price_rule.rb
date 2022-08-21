require 'base_rule'
class ChangeBasePriceRule < BaseRule

  def initialize(threshold_value = 0, final_price = 0 )
    @threshold_value = threshold_value
    @final_price = BigDecimal(final_price)
  end


  # total_items:  how many items was in cart 
  # base_price:   base_price of rule
  def execute(total_items, base_price)
    if total_items < @threshold_value
      total_items * base_price
    else
      total_items * @final_price
    end
  end

end
