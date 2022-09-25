class ChangePriceColumnsToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :cart_items, :base_price, :integer, using: 'base_price::integer'
    change_column :cart_items, :total_price, :integer, using: 'total_price::integer'
    change_column :carts, :gross_amount, :integer, using: 'gross_amount::integer'
    change_column :items, :item_price, :integer, using: 'item_price::integer'
    change_column :addons, :display_price, :integer, using: 'display_price::integer'
    change_column :variations, :display_price, :integer, using: 'display_price::integer'
    change_column :variations, :item_price, :integer, using: 'item_price::integer'
  end
end
