require_relative '../../lib/base_rule'
require_relative '../../lib/pay_one_get_x_for_free_rule'
require_relative '../../lib/change_base_price_rule'
require_relative '../../lib/apply_discount_rule'
require_relative '../../lib/check_out'
require 'bigdecimal'
 
describe CheckOut do

  context ": In the context of pricings and rules of requirements" do
    
    let(:pricing_rules){
      #by default BaseRule      
      pricing_rules = Hash.new(BaseRule.new)
      
      #instance and add to rules for code GR1 the pay-one-get-1-for-free rule
      x_for_free_value = 1    
      pricing_rules["GR1"] = PayOneGetXForFreeRule.new(x_for_free_value)

        
      #instance and add to rules for code SR1 the change-base-price rule       
      items_to_get_a_good_price = 3
      new_price = BigDecimal("4.5")
      pricing_rules["SR1"] = ChangeBasePriceRule.new(items_to_get_a_good_price, new_price)
      

      #instance and add to rules for code CF1 the apply-discount rule
      minimum_items_to_get_good_price = 3
      parts = 2
      total_parts = 3
      pricing_rules["CF1"] = ApplyDiscountRule.new(minimum_items_to_get_good_price, parts, total_parts)
      
      pricing_rules
    }

    it "should get expected total price of 22.45£ when basket is: GR1,SR1,GR1,GR1,CF1" do 
      co = CheckOut.new(pricing_rules)
      co.scan("GR1")
      co.scan("SR1")
      co.scan("GR1")
      co.scan("GR1")
      co.scan("CF1")
      price = co.total 

      expect(price).to eq(22.45)
    end

    it "should get expected total price of 3.11£ when basket is: GR1,GR1" do 
      co = CheckOut.new(pricing_rules)
      co.scan("GR1")
      co.scan("GR1")
      price = co.total 

      expect(price).to eq(3.11)
    end

    it "should get expected total price of 16.61£ when basket is: SR1,SR1,GR1,SR1" do 
      co = CheckOut.new(pricing_rules)
      co.scan("SR1")
      co.scan("SR1")
      co.scan("GR1")
      co.scan("SR1")
      price = co.total 

      expect(price).to eq(16.61)
    end

    it "should get expected total price of 30.57£ when basket is: GR1,CF1,SR1,CF1,CF1" do 
      
      co = CheckOut.new(pricing_rules)
      co.scan("GR1")
      co.scan("CF1")
      co.scan("SR1")
      co.scan("CF1")
      co.scan("CF1")
      price = co.total 

      expect(price).to eq(30.57)
    end
  
  end  
end
