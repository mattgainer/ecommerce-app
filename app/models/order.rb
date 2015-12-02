class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :user, presence: true

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
  def running_subtotal
    sum = BigDecimal.new("000.00")
    carted_products.each do |product|
      if !product.removed
        sum += product.price
      end
    end
    sum
  end
  def running_tax
    sum = BigDecimal.new("000.00")
    carted_products.each do |product|
      if !product.removed
        sum += product.tax_calc
      end
    end
    sum
  end
  def running_total
    sum = BigDecimal.new("000.00")
    carted_products.each do |product|
      if !product.removed
        sum += product.total_price
      end
    end
    sum
  end
end
