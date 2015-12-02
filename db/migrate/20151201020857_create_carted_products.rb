class CreateCartedProducts < ActiveRecord::Migration
  def change
    create_table :carted_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.boolean :removed, default: false

      t.timestamps null: true
    end
  end
end
