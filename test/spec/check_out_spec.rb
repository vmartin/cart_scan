require_relative '../../lib/base_rule'
require_relative '../../lib/check_out'
require 'bigdecimal'
 
describe CheckOut do

  context ": In the context of pricings and rules of requirements" do
    
    let(:pricing_rules){
      princing_rules = Hash.new(BaseRule)
      princing_rules
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
