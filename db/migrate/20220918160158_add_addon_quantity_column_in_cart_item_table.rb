class AddAddonQuantityColumnInCartItemTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :addon_quantity, :integer
  end
end
