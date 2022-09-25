# frozen_string_literal: true

class CreateAddons < ActiveRecord::Migration[6.1]
  def change
    create_table :addons do |t|
      t.string :name
      t.string :description
      t.string :item_id
      t.string :display_price

      t.timestamps
    end
  end
end
