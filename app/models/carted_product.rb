class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  def price
    Product.find_by(id: product_id).price * quantity
  end
  def tax_calc
    Product.find_by(id: product_id).tax_calc * quantity
  end
  def total_price
    Product.find_by(id: product_id).total_price * quantity
  end
  def dollar(value)
    "$#{sprintf("%.2f", value)}"
  end
end
