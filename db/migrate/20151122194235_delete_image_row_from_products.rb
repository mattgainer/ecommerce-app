class DeleteImageRowFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :Image, :text
  end
end
