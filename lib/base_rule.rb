class BaseRule
  
  # - Base calculation
  # total_items: number of scanned products for a concret product_code
  # base_price:  price without discounts for a concret product_code
  def execute total_items, base_price
      total_items * base_price    
  end

end
