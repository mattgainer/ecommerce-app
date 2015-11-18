class Product < ActiveRecord::Base
  def self.discount
    100
  end

  def price_dollar_form(value)
    "$#{sprintf("%.2f", value)}"
  end
  def discount_message
    if price <= Product.discount
      "Discount Item!!!"
    else
      "On Sale!!!"
    end
  end
  def tax_calc
    price * 9 / 100
  end
  def total_price
    price + tax_calc
  end
  def instock_message
    if instock == true
      "Currently In Stock"
    else
      "Not Currently In Stock"
    end
  end

end
