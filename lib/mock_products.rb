require 'bigdecimal'
class MockProducts

  PRODUCTS = {
    "GR1" => { :product_code => "GR1", :product_name => "Green Tea", :price => BigDecimal("3.11") },
    "SR1" => { :product_code => "GR1", :product_name => "Strawberries", :price => BigDecimal("5.00") },
    "CF1" => { :product_code => "GR1", :product_name => "Coffe", :price => BigDecimal("11.23") }
  }

  def self.get_price product_code
    PRODUCTS.has_key?(product_code) ? PRODUCTS[product_code][:price] : BigDecimal(0)
  end

end
