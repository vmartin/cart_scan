require 'base_rule'
class ApplyDiscountRule < BaseRule

 
  def initialize(threshold_value = 0, parts = 1, total_parts = 1)
    @threshold_value = threshold_value
    @parts = parts
    @total_parts = total_parts
  end

   
end
