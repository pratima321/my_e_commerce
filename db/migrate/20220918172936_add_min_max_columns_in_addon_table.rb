class AddMinMaxColumnsInAddonTable < ActiveRecord::Migration[6.1]
  def change
    add_column :addons, :min, :integer
    add_column :addons, :max, :integer
  end
end
