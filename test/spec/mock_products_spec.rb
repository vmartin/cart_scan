require_relative '../../lib/mock_products'
require 'bigdecimal'
 
describe MockProducts do

  it "should get price of 0.0£ when product code don't exixst" do   
    expect(MockProducts.get_price("INVENTED_CODE")).to eq(0)  
  end

  it "should get price of 3.11£ when product code is GR1" do   
    expect(MockProducts.get_price("GR1")).to eq(3.11)  
  end

  it "should get price of 5.0£ when product code is SR1" do   
    expect(MockProducts.get_price("SR1")).to eq(5.00)  
  end 

  it "should get price of 11.23£ when product code CF1" do    
    expect(MockProducts.get_price("CF1")).to eq(11.23)  
  end 


end
