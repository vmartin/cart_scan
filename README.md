# cart_scan
Ruby classes to agregate items and proces their prices given diferent price rules

## Solution explained

El objetivo de la solucion aportada a sido desacoplar la logica de calculo de precios de la classe chekcout y las pricing rules.

Para conseguir esto se ha planteado una classe "BaseRule" de la que heredan las demas reglas de calculo de precios (PayOneGetXForFreeRule, ApplyDiscountRule, ChangeBasePriceRule), estas subclasses implementan un constructor con los parametros necessarios para inicializar la regla y una concrecion del metodo "execute".

Por otra banda, la classe checkout cumple con el contrato de interficie especificado en los requisitos. Esto lo hace contando cuantas ocurrencias scanea de cada codigo de producto y finalmente obtiene el total a partir de las reglas de precios correctamente inicalizadas para cada producto.

Los archivos a tener en cuenta para todo esto son:

```bash
 lib/base_rule.rb
 lib/pay_one_get_x_for_free_rule.rb
 lib/change_base_price_rule.rb
 lib/apply_discount_rule.rb  
 lib/check_out.rb 
```

Sin enbargo, no me ha dado tiempo de bajar el acoplamiento de la classe check_out.rb con mock_products.rb, aun asi, pienso que sigue siendo una buena solucion, ya que esta classe podria obtener los precios del un servicio de datos y no de un hash map estatico como lo hace ahora.

```bash
lib/mock_products_spec.rb 
```

Finalmente, se han incluido rspec test para todas las classes de proyecto y con diferentes contextos para verificar las funcionalidades parametrizables de estas classes.

```bash
 test/spec/base_rule_spec.rb
 test/spec/pay_one_get_x_for_free_rule_spec.rb
 test/spec/change_base_price_rule_spec.rb
 test/spec/apply_discount_rule_spec.rb  
 test/spec/mock_products_spec.rb 
 test/spec/check_out_spec.rb 
```

Especial atencion a la RSpec "check_out_spec.rb" este test contiene un contexto para la test data de los requisitos con y sin reglas de precios.


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


