# cart_scan
Ruby classes to agregate items and proces their prices given diferent price rules

## Solution explained

The objective of the solution provided has been to decouple the price calculation logic of the checkout class and the pricing rules.

To achieve this, a "BaseRule" class has been proposed from which the other price calculation rules inherit (PayOneGetXForFreeRule, ApplyDiscountRule, ChangeBasePriceRule), these subclasses implement a constructor with the necessary parameters to initialize the rule and a specification of the "execute" method. ".

On the other hand, the checkout class complies with the interface contract specified in the requirements. It does this by counting how many occurrences it scans of each product code and finally gets the total from the correctly initialized pricing rules for each product.

The files to keep in mind for all this are:

```bash
 lib/base_rule.rb
 lib/pay_one_get_x_for_free_rule.rb
 lib/change_base_price_rule.rb
 lib/apply_discount_rule.rb  
 lib/check_out.rb 
```

However, I haven't had time to download the coupling of the check_out.rb class with mock_products.rb, even so, I think it's still a good solution, since this class could obtain the prices of a data service and not of a static hash map as it does now.

```bash
lib/mock_products.rb 
```

Finally, rspec tests have been included for all the project classes and with different contexts to verify the parameterizable functionalities of these classes.

```bash
 test/spec/base_rule_spec.rb
 test/spec/pay_one_get_x_for_free_rule_spec.rb
 test/spec/change_base_price_rule_spec.rb
 test/spec/apply_discount_rule_spec.rb  
 test/spec/mock_products_spec.rb 
 test/spec/check_out_spec.rb 
```

Special attention to the RSpec "check_out_spec.rb" this test contains a context for the test data of the requirements with and without pricing rules. In this file can see how use the solution:

```bash
describe CheckOut do

  context ": In the context of pricings and princing rules of requirements" do
    
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

    # more assertions not listed ...

  end
end
```

## Tech Stack

**Ruby version:** Ruby 2.7.6

**Testing:**      RSpec 3.11.0


## Runing tests Locally

Clone the project

```bash
  git clone git@github.com:vmartin/cart_scan.git
```

Go to the project directory

```bash
  cd cart_scan
```

Install dependencies

```bash
  bundle install
```

Run all tests

```bash
  ./execute_all_rspec_test.sh
```

## 🚀 About Me

My name is Victor Martin-Romo and I love Ruby,

Throughout my working life I have had the opportunity to work with many programming languages (Ruby, Java, Pl/sql, c#, Vb, php, Angular, Angular JS, others...) and development platforms (.Net , Oracle Forms, OutSystems), I have learned something from all of them and luckily I have always been able to work on Ruby on Rails projects.

The good thing about all this is that you gain experience and different visions of how to solve a problem or how technology forces us to solve it, the bad thing is that in none of these frameworks do I feel as free as with Ruby on Rails.

It is what it has to have tried it...

## 🛠 Skills

**Languages:** Ruby, Java, JavaScript, TypeScript, PL/Sql, C#, Vb6, VB.net

**Frameworks:** Rails, Spring, Spring Boot, Struts, AngularJS, Angular 2.x

**BD:** MySQl, Oracle

**NoSQL BD:** Mongo DB, Solr, Redis 

## License
 
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


