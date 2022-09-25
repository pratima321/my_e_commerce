# frozen_string_literal: true

class CreateVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :variations do |t|
      t.string :name
      t.string :description
      t.string :item_id
      t.string :display_price
      t.string :item_price

      t.timestamps
    end
  end
end
