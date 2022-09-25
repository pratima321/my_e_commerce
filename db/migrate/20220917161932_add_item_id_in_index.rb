class AddItemIdInIndex < ActiveRecord::Migration[6.1]
  def up
    remove_index(
      :cart_items,
      %i[variation_id addon_id],
      unique: true,
      name: 'index_cart_items_on_variation_id_and_addon_id'
    )

    add_index(
      :cart_items,
      %i[item_id variation_id addon_id],
      unique: true,
      name: 'index_cart_items_on_item_id_variation_id_and_addon_id'
    )
  end

  def down
    add_index(
      :cart_items,
      %i[variation_id addon_id],
      unique: true,
      name: 'index_cart_items_on_variation_id_and_addon_id'
    )

    remove_index(
      :cart_items,
      %i[item_id variation_id addon_id],
      unique: true,
      name: 'index_cart_items_on_item_id_variation_id_and_addon_id'
    )
  end
end
