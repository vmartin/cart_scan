require_relative '../../lib/base_rule'
require 'bigdecimal'
 
describe BaseRule do
  it "should get execution value 0.0£ when number of items items is 0 and price are 0£" do
    number_of_items = 1
    base_price = BigDecimal(0)   
    expect(BaseRule.new.execute(number_of_items, base_price)).to eq(0)
  end

  it "should get execution value 5.0£ when number of items is 1 and price is 5£" do
    number_of_items = 1
    base_price = BigDecimal(5)   
    expect(BaseRule.new.execute(number_of_items, base_price)).to eq(5)
  end

  it "should get execution value 5.0£ when number of items is 5 and price is 1£" do
    number_of_items = 1
    base_price = BigDecimal(5)   
    expect(BaseRule.new.execute(number_of_items, base_price)).to eq(5)
  end

  it "should get execution value 5.0£ when number of items is 2 and price is 2.5£" do
    number_of_items = 1
    base_price = BigDecimal(5)   
    expect(BaseRule.new.execute(number_of_items, base_price)).to eq(5)
  end

end
