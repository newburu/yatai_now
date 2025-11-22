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

ActiveRecord::Schema[8.1].define(version: 2025_11_16_152001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admin_festivals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_active"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "festivals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.boolean "is_active"
    t.string "name"
    t.date "start_date"
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.bigint "stall_id", null: false
    t.datetime "timestamp"
    t.datetime "updated_at", null: false
    t.index ["stall_id"], name: "index_locations_on_stall_id"
  end

  create_table "stalls", force: :cascade do |t|
    t.string "auth_code"
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "festival_id", null: false
    t.string "name"
    t.string "status_text"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["festival_id"], name: "index_stalls_on_festival_id"
    t.index ["user_id"], name: "index_stalls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "locations", "stalls"
  add_foreign_key "stalls", "festivals"
  add_foreign_key "stalls", "users"
end
