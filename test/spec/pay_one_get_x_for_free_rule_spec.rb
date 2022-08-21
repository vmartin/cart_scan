require_relative '../../lib/pay_one_get_x_for_free_rule'
require 'bigdecimal'
 
describe PayOneGetXForFreeRule do
  
  context "In 'pay One get x(one) for free' context" do 
    
    x_for_free_value = 1
    let!(:ruleOneForFree){PayOneGetXForFreeRule.new(x_for_free_value)}


    it "should get execution value 0.0£ when number of items items is 0 and price are 0£" do
      number_of_items = 0
      base_price = BigDecimal(0)   
      expect(ruleOneForFree.execute(number_of_items, base_price)).to eq(0)
    end

    it "should get execution value 5.0£ when number of items is 1 and price is 5£" do
      number_of_items = 1
      base_price = BigDecimal(5)   
      expect(ruleOneForFree.execute(number_of_items, base_price)).to eq(5)
    end

    it "should get execution value 5.0£ when number of items is 2 and price is 5£" do
      number_of_items = 2
      base_price = BigDecimal(5)   
      expect(ruleOneForFree.execute(number_of_items, base_price)).to eq(5)
    end

    it "should get execution value 10.0£ when number of items is 3 and price is 5£" do
      number_of_items = 3
      base_price = BigDecimal(5)   
      expect(ruleOneForFree.execute(number_of_items, base_price)).to eq(10)
    end

    it "should get execution value 10.0£ when number of items is 4 and price is 5£" do
      number_of_items = 4
      base_price = BigDecimal(5)   
      expect(ruleOneForFree.execute(number_of_items, base_price)).to eq(10)
    end

    it "should get execution value 15.0£ when number of items is 5 and price is 5£" do
      number_of_items = 5
      base_price = BigDecimal(5)   
      expect(ruleOneForFree.execute(number_of_items, base_price)).to eq(15)
    end

  end

  context "In 'pay One get x(two) for free' context" do 
    
    x_for_free_value = 2
    let!(:ruleTwoForFree){PayOneGetXForFreeRule.new(x_for_free_value)}


    it "should get execution value 0.0£ when number of items items is 0 and price are 0£" do
      number_of_items = 0
      base_price = BigDecimal(0)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(0)
    end

    it "should get execution value 5.0£ when number of items is 1 and price is 5£" do
      number_of_items = 1
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(5)
    end

    it "should get execution value 5.0£ when number of items is 2 and price is 5£" do
      number_of_items = 2
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(5)
    end

    it "should get execution value 5.0£ when number of items is 3 and price is 5£" do
      number_of_items = 3
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(5)
    end

    it "should get execution value 10.0£ when number of items is 4 and price is 5£" do
      number_of_items = 4
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(10)
    end

    it "should get execution value 10.0£ when number of items is 5 and price is 5£" do
      number_of_items = 5
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(10)
    end

    it "should get execution value 10.0£ when number of items is 6 and price is 5£" do
      number_of_items = 6
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(10)
    end

    it "should get execution value 15.0£ when number of items is 7 and price is 5£" do
      number_of_items = 7
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(15)
    end

    it "should get execution value 15.0£ when number of items is 9 and price is 5£" do
      number_of_items = 9
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(15)
    end

    it "should get execution value 10.0£ when number of items is 10 and price is 5£" do
      number_of_items = 10
      base_price = BigDecimal(5)   
      expect(ruleTwoForFree.execute(number_of_items, base_price)).to eq(20)
    end


  end

end
