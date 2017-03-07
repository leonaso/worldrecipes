class AddAdminToChefs < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :admin, :boolean, default: false
    add_column :chefs, :role, :boolean, default: false
  end
end
