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

ActiveRecord::Schema[7.0].define(version: 2025_03_28_195411) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "billing_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "service_record_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_record_id"], name: "index_feedbacks_on_service_record_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "cleaning_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_locations_on_account_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "role"
    t.index ["user_id", "role"], name: "index_partners_on_user_id_and_role", unique: true
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "service_records", force: :cascade do |t|
    t.integer "partner_id", null: false
    t.integer "location_id", null: false
    t.date "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_service_records_on_location_id"
    t.index ["partner_id"], name: "index_service_records_on_partner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "feedbacks", "service_records"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "locations", "accounts"
  add_foreign_key "partners", "users"
  add_foreign_key "service_records", "locations"
  add_foreign_key "service_records", "partners"
end
