# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_17_152452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.string "description"
    t.integer "amount"
    t.string "current_sales_person_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.string "action"
    t.string "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_histories_on_item_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.boolean "deleted", default: false, null: false
    t.integer "qty_type", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "one_menus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "index", default: 1
    t.integer "position"
    t.boolean "ice", default: false
  end

  create_table "order_products", force: :cascade do |t|
    t.float "quntity"
    t.integer "price"
    t.string "name"
    t.integer "total"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_ids", default: [], array: true
    t.float "quntities", default: [], array: true
    t.integer "user_id"
    t.integer "status", default: 0
    t.string "contact_number"
    t.string "address"
    t.text "special_notes"
    t.boolean "customer"
    t.float "index", default: [], array: true
    t.integer "discount", default: 0
    t.integer "total"
    t.integer "other_charges", default: 0
    t.integer "disc", default: 0
    t.boolean "edited", default: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "quntity", default: 1.0
    t.integer "price"
    t.integer "one_menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_type", default: 0
    t.integer "order_id"
    t.integer "total", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "sale", default: false
    t.string "address"
    t.string "contact"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "histories", "items"
  add_foreign_key "histories", "users"
  add_foreign_key "items", "users"
end
