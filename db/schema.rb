# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_918_172_936) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addons', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'item_id'
    t.integer 'display_price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'min'
    t.integer 'max'
  end

  create_table 'cart_items', force: :cascade do |t|
    t.string 'cart_id'
    t.string 'variation_id'
    t.string 'addon_id'
    t.integer 'quantity', default: 1
    t.integer 'total_price'
    t.integer 'base_price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'item_id'
    t.integer 'addon_quantity'
    t.index %w[item_id variation_id addon_id], name: 'index_cart_items_on_item_id_variation_id_and_addon_id',
                                               unique: true
    t.index %w[item_id variation_id], name: 'index_cart_items_on_item_id_and_variation_id', unique: true
  end

  create_table 'carts', force: :cascade do |t|
    t.string 'user_id'
    t.integer 'gross_amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'item_count'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.string 'image'
    t.string 'description'
    t.string 'category_id'
    t.integer 'item_price'
    t.string 'is_item_available'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'mobile_number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'variations', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'item_id'
    t.integer 'display_price'
    t.integer 'item_price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
