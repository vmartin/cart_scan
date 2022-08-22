require_relative '../../lib/apply_discount_rule'
require 'bigdecimal'
 
describe ApplyDiscountRule do
  
  context ": In Apply discount of two thirds of original price when you buy three or more items context" do 
    
    minimum_items_to_get_good_price = 3
    parts = 2
    total_parts = 3
    let!(:applyDiscountTwoThirds){ApplyDiscountRule.new(minimum_items_to_get_good_price, parts, total_parts)}


    it "should get execution value 0.0£ when number of items is 0 or price are 0£" do

      number_of_items = 1
      base_price = BigDecimal(0)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(0)

      number_of_items = 0
      base_price = BigDecimal(1)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(0)

    end

    it "should get execution value 3.0£ when number of items is 1 and price is 3£" do
      number_of_items = 1
      base_price = BigDecimal(3)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(3)
    end

    it "should get execution value 6.0£ when number of items is 2 and price is 3£" do
      number_of_items = 2
      base_price = BigDecimal(3)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(6)
    end

    it "should get execution value 6.0£ when number of items is 3 and price is 3£" do
      number_of_items = 3
      base_price = BigDecimal(3)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(6)
    end

    it "should get execution value 8.0£ when number of items is 4 and price is 3£" do
      number_of_items = 4
      base_price = BigDecimal(3)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(8)
    end

    it "should get execution value 10.0£ when number of items is 5 and price is 3£" do
      number_of_items = 5
      base_price = BigDecimal(3)   
      expect(applyDiscountTwoThirds.execute(number_of_items, base_price)).to eq(10)
    end

  end


end
