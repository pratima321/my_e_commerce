# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :category_id
      t.string :item_price
      t.string :is_item_available

      t.timestamps
    end
  end
end
