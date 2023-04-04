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

ActiveRecord::Schema.define(version: 2023_04_04_102725) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "dummies", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "born_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.index ["email"], name: "index_dummies_on_email", unique: true
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name"
    t.integer "user_category_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_expense_categories_on_destroyed_at"
    t.index ["slug"], name: "index_expense_categories_on_slug", unique: true
    t.index ["user_category_id"], name: "index_expense_categories_on_user_category_id"
  end

  create_table "expense_sub_categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id", null: false
    t.integer "user_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.datetime "destroyed_at"
    t.index ["category_id"], name: "index_expense_sub_categories_on_category_id"
    t.index ["destroyed_at"], name: "index_expense_sub_categories_on_destroyed_at"
    t.index ["slug"], name: "index_expense_sub_categories_on_slug", unique: true
    t.index ["user_category_id"], name: "index_expense_sub_categories_on_user_category_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "transaction_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_transaction_modes_on_destroyed_at"
  end

  create_table "transaction_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_transaction_statuses_on_destroyed_at"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_transaction_types_on_destroyed_at"
  end

# Could not dump table "transactions" because of following StandardError
#   Unknown type 'attachment' for column 'document'

# Could not dump table "user_categories" because of following StandardError
#   Unknown type 'attachment' for column 'background'

# Could not dump table "users" because of following StandardError
#   Unknown type 'attachment' for column 'avatar'

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "expense_categories", "user_categories"
  add_foreign_key "expense_sub_categories", "expense_categories", column: "category_id"
  add_foreign_key "expense_sub_categories", "user_categories"
  add_foreign_key "transactions", "expense_sub_categories", column: "expense_category_id"
  add_foreign_key "transactions", "transaction_modes", column: "mode_id"
  add_foreign_key "transactions", "transaction_statuses", column: "status_id"
  add_foreign_key "transactions", "transaction_types", column: "type_id"
  add_foreign_key "transactions", "user_categories"
  add_foreign_key "transactions", "users", column: "payer_id"
  add_foreign_key "transactions", "users", column: "receiver_id"
  add_foreign_key "user_categories", "users"
end
