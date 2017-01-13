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

ActiveRecord::Schema.define(version: 20161228090534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "in_stock"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id", using: :btree
    t.index ["user_id"], name: "index_inventories_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "purchase_price"
    t.decimal  "sale_price"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "provider_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["provider_id"], name: "index_products_on_provider_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_providers_on_user_id", using: :btree
  end

  create_table "sales", force: :cascade do |t|
    t.decimal  "price"
    t.string   "description"
    t.integer  "product_id"
    t.decimal  "quantity"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_sales_on_product_id", using: :btree
    t.index ["user_id"], name: "index_sales_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "access_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "inventories", "products"
  add_foreign_key "inventories", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "users"
  add_foreign_key "providers", "users"
  add_foreign_key "sales", "products"
  add_foreign_key "sales", "users"
end
