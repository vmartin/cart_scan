require 'base_rule'
class ChangeBasePriceRule < BaseRule

  
  def initialize(threshold_value = 0, final_price = 0 )
    @threshold_value = threshold_value
    @final_price = BigDecimal(final_price)
  end


end
