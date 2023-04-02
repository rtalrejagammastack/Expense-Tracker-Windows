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

ActiveRecord::Schema.define(version: 2023_04_02_053854) do

  create_table "expense_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "show", default: true
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
    t.boolean "show", default: true
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

  create_table "transactions", force: :cascade do |t|
    t.string "title"
    t.float "amount"
    t.text "description"
    t.string "payer_name"
    t.string "receiver_name"
    t.integer "user_category_id", null: false
    t.integer "expense_category_id"
    t.integer "status_id", null: false
    t.integer "type_id", null: false
    t.integer "mode_id", null: false
    t.integer "receiver_id"
    t.integer "payer_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_transactions_on_destroyed_at"
    t.index ["expense_category_id"], name: "index_transactions_on_expense_category_id"
    t.index ["mode_id"], name: "index_transactions_on_mode_id"
    t.index ["payer_id"], name: "index_transactions_on_payer_id"
    t.index ["receiver_id"], name: "index_transactions_on_receiver_id"
    t.index ["slug"], name: "index_transactions_on_slug", unique: true
    t.index ["status_id"], name: "index_transactions_on_status_id"
    t.index ["type_id"], name: "index_transactions_on_type_id"
    t.index ["user_category_id"], name: "index_transactions_on_user_category_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "expense", default: "0.0"
    t.decimal "income", default: "0.0"
    t.integer "user_id", null: false
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_user_categories_on_destroyed_at"
    t.index ["slug"], name: "index_user_categories_on_slug", unique: true
    t.index ["user_id"], name: "index_user_categories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "phone_number"
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_users_on_destroyed_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

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
