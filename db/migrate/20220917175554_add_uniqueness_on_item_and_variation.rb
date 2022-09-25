class AddUniquenessOnItemAndVariation < ActiveRecord::Migration[6.1]
  def change
    add_index(
      :cart_items,
      %i[item_id variation_id],
      unique: true,
      name: 'index_cart_items_on_item_id_and_variation_id'
    )
  end
end
