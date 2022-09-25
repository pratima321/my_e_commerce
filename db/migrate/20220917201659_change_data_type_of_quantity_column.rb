class ChangeDataTypeOfQuantityColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :cart_items, :quantity, :integer, using: 'quantity::integer', default: 1
  end
end
