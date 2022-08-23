require 'mock_products'
class CheckOut 

  def initialize(pricing_rules = [])
    @pricing_rules = pricing_rules
    @counter = Hash.new(0)
  end

  def scan item
    @counter[item] += 1
  end

  def total
    aux = BigDecimal(0)
    @counter.each do | product_code, number_of_items |
      aux += @pricing_rules[product_code].execute(number_of_items, MockProducts.get_price(product_code))
    end
    return aux.round(2)
  end
end
