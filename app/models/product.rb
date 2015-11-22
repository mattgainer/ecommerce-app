class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  def self.discount
    1.00
  end
  def self.random_id
    product_id = []
    Product.all.each do |product|
      product_id << product.id
    end
    product_id[rand(0..product_id.length - 1)]
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
