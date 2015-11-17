class Product < ActiveRecord::Base
  def self.discount
    100
  end

  def price_dollar_form(value)
    if value < 10;
      "$0.0#{value}"
    elsif value < 100
      "$0.#{value}"
    elsif value%100 < 10
      "$#{value/100}.0#{value%100}"
    else
      "$#{value/100}.#{value%100}"
    end
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


end
