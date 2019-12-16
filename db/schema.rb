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

ActiveRecord::Schema.define(version: 2019_12_16_084250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.bigint "supermarket_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
    t.index ["supermarket_id"], name: "index_inventories_on_supermarket_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.boolean "bought"
    t.bigint "product_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_items_on_list_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.integer "quantity"
    t.string "unit"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "base_price_cents", default: 0, null: false
  end

  create_table "supermarkets", force: :cascade do |t|
    t.string "chain"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_list_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["current_list_id"], name: "index_users_on_current_list_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "products"
  add_foreign_key "inventories", "supermarkets"
  add_foreign_key "items", "lists"
  add_foreign_key "items", "products"
  add_foreign_key "lists", "users"
  add_foreign_key "users", "lists", column: "current_list_id"
end
