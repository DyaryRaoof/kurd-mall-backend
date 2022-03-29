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

ActiveRecord::Schema[7.0].define(version: 2022_03_29_174030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name_ku"
    t.string "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "with_user_id"
    t.bigint "response_to_chat_id"
    t.string "with_user_nam"
    t.string "with_user_image"
    t.string "message"
    t.boolean "is_read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name_en"
    t.string "name_ku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
  end

  create_table "item_analytics", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "item_name"
    t.bigint "lifetime_views"
    t.integer "total_stars"
    t.bigint "total_reviews"
    t.bigint "total_shares"
    t.bigint "total_comments"
    t.bigint "total_revenue_usd"
    t.bigint "total_revenue_iqd"
    t.bigint "total_item_sales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.index ["item_id"], name: "index_item_analytics_on_item_id"
    t.index ["store_id"], name: "index_item_analytics_on_store_id"
  end

  create_table "item_comments", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.string "user_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
    t.index ["item_id"], name: "index_item_comments_on_item_id"
    t.index ["user_id"], name: "index_item_comments_on_user_id"
  end

  create_table "item_stars", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.integer "number"
    t.integer "reviewers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["item_id"], name: "index_item_stars_on_item_id"
    t.index ["user_id"], name: "index_item_stars_on_user_id"
  end

  create_table "item_variants", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "store_id", null: false
    t.string "name"
    t.string "value"
    t.float "price"
    t.float "cost"
    t.string "currency"
    t.integer "image_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_variants_on_item_id"
    t.index ["store_id"], name: "index_item_variants_on_store_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.string "name"
    t.text "description"
    t.float "price"
    t.string "currency"
    t.boolean "is_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id", null: false
    t.bigint "category_id", null: false
    t.bigint "subcategory_id", null: false
    t.float "cost"
    t.integer "shipping_kg"
    t.integer "quantity"
    t.string "store_name"
    t.bigint "store_phone"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["city_id"], name: "index_items_on_city_id"
    t.index ["store_id"], name: "index_items_on_store_id"
    t.index ["subcategory_id"], name: "index_items_on_subcategory_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "order_variants", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_variant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_variant_id"], name: "index_order_variants_on_item_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.bigint "item_id", null: false
    t.integer "order_no"
    t.bigint "driver_id"
    t.string "item_name"
    t.string "supplier_name"
    t.float "price"
    t.string "currency"
    t.integer "shipping_kg"
    t.integer "quantity"
    t.integer "total_weight"
    t.float "total_price"
    t.boolean "is_picked_up"
    t.boolean "is_delivered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ordered"
    t.bigint "user_phone"
    t.bigint "store_phone"
    t.bigint "driver_phone"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "store_analytics", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.string "store_name"
    t.bigint "lifetime_views"
    t.integer "total_stars"
    t.bigint "total_reviews"
    t.bigint "total_shares"
    t.bigint "total_comments"
    t.bigint "total_revenue_usd"
    t.bigint "total_revenue_iqd"
    t.bigint "total_item_sales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_analytics_on_store_id"
  end

  create_table "store_comments", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "user_id", null: false
    t.string "user_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
    t.index ["store_id"], name: "index_store_comments_on_store_id"
    t.index ["user_id"], name: "index_store_comments_on_user_id"
  end

  create_table "store_stars", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.integer "number"
    t.integer "reviewers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_stars_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.string "address"
    t.bigint "phone"
    t.string "instagram"
    t.string "facebook"
    t.float "locaation_long"
    t.float "location_lat"
    t.boolean "is_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id", null: false
    t.bigint "category_id", null: false
    t.bigint "subcategory_id", null: false
    t.index ["category_id"], name: "index_stores_on_category_id"
    t.index ["city_id"], name: "index_stores_on_city_id"
    t.index ["subcategory_id"], name: "index_stores_on_subcategory_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name_ku"
    t.string "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_tags_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "image"
    t.bigint "phone"
    t.boolean "is_driver"
    t.boolean "is_admin"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "unconfirmed_email"
    t.integer "store_id"
    t.integer "city_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "users"
  add_foreign_key "item_analytics", "items"
  add_foreign_key "item_analytics", "stores"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "item_stars", "items"
  add_foreign_key "item_stars", "users"
  add_foreign_key "item_variants", "items"
  add_foreign_key "item_variants", "stores"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "cities"
  add_foreign_key "items", "stores"
  add_foreign_key "items", "subcategories"
  add_foreign_key "items", "users"
  add_foreign_key "order_variants", "item_variants"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "stores"
  add_foreign_key "orders", "users"
  add_foreign_key "store_analytics", "stores"
  add_foreign_key "store_comments", "stores"
  add_foreign_key "store_comments", "users"
  add_foreign_key "store_stars", "stores"
  add_foreign_key "stores", "categories"
  add_foreign_key "stores", "cities"
  add_foreign_key "stores", "subcategories"
  add_foreign_key "stores", "users"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "tags", "items"
end
