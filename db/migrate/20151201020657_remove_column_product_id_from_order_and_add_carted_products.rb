class RemoveColumnProductIdFromOrderAndAddCartedProducts < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id, :integer
    add_column :orders, :open, :boolean, default: true
  end
end
