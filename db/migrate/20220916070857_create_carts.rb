# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :user_id
      t.string :gross_amount

      t.timestamps
    end
  end
end
