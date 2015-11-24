class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  def add_totals
    product = Product.find_by(id: product_id)
    update(subtotal: product.price * quantity, tax: product.tax_calc * quantity, total: product.total_price * quantity)
  end
  def price_dollar_form(value)
    "$#{sprintf("%.2f", value)}"
  end
  def nice_time_form(value)
    value.strftime('%D, %I:%M')
  end
end
