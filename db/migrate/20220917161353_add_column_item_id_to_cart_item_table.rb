class AddColumnItemIdToCartItemTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :item_id, :string
  end
end
