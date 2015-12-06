class ChangeNameToCompanyNameAndAddFirstAndLastNameToSuppliers < ActiveRecord::Migration
  def change
    rename_column :suppliers, :name, :company_name
    add_column :suppliers, :first_name, :string
    add_column :suppliers, :last_name, :string
  end
end
