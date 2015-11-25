class DeleteImageRowFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image, :text
  end
end
