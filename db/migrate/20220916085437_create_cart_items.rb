# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.string :cart_id
      t.string :variation_id
      t.string :addon_id
      t.string :quantity
      t.string :total_price
      t.string :base_price

      t.timestamps
    end

    add_index(
      :cart_items,
      %i[variation_id addon_id],
      unique: true,
      name: 'index_cart_items_on_variation_id_and_addon_id'
    )
  end
end
