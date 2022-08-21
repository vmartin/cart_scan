require_relative '../../lib/change_base_price_rule'
require 'bigdecimal'
 
describe ChangeBasePriceRule do
  
  context "In 'change base price to 4.5£ when you take 3 or more items' context" do 
    
    items_to_get_a_good_price = 3
    new_price = BigDecimal("4.5")

    let!(:new_price_for_3_or_more_rule){ChangeBasePriceRule.new(items_to_get_a_good_price, new_price)}
    
    it "should get execution value 0.0£ when number of items items is 0 or price are 0.0£" do
      
      number_of_items = 1
      base_price = BigDecimal(0)   

      expect(new_price_for_3_or_more_rule.execute(number_of_items, base_price)).to eq(0)  

      number_of_items = 0
      base_price = BigDecimal(1)
      expect(new_price_for_3_or_more_rule.execute(number_of_items, base_price)).to eq(0)  
    end

    it "should get execution value 5.0£ when number of items is 1 and price is 5.0£" do
      number_of_items = 1
      base_price = BigDecimal(5)   
      expect(new_price_for_3_or_more_rule.execute(number_of_items, base_price)).to eq(5)
    end

    it "should get execution value 10.0£ when number of items is 2 and price is 5.0£" do
      number_of_items = 2
      base_price = BigDecimal(5)   
      expect(new_price_for_3_or_more_rule.execute(number_of_items, base_price)).to eq(10)
    end

    it "should get execution value 9.0£ when number of items is 3 and price is 5.0£" do
      number_of_items = 3
      base_price = BigDecimal(5)   
      expect(new_price_for_3_or_more_rule.execute(number_of_items, base_price)).to eq(9)
    end

    it "should get execution value 13.5£ when number of items is 3 and price is 5.0£" do
      number_of_items = 4
      base_price = BigDecimal(5)   
      expect(new_price_for_3_or_more_rule.execute(number_of_items, base_price)).to eq(13.5)
    end


  end

end
