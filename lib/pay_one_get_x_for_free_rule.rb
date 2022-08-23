require 'base_rule'
class PayOneGetXForFreeRule < BaseRule

  # x_for_free_value: integer that represents how many items for free
  # you will get for each one payed
  def initialize(x_for_free = 0)
    @x_for_free = x_for_free
  end

  # - Change base price calculation
  #  
  # total_items: number of scanned products for a concret product_code
  # base_price:  price without discounts for a concret product_code
  #
  # how do it:   play with the integer division and the remainder
  def execute(total_items, base_price)

    remainder = total_items.modulo(@x_for_free + 1)
    #when residue is greather than 0 we count one item more 
    (total_items.div(@x_for_free + 1)  * base_price) + (  ( remainder != 0 ? 1 : 0)  * base_price)    
  end

end
