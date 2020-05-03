# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_03_035753) do

  create_table "buildings", force: :cascade do |t|
    t.integer "type"
    t.string "identifier"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "engagements", force: :cascade do |t|
    t.integer "role"
    t.integer "user_id", null: false
    t.integer "building_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_engagements_on_building_id"
    t.index ["user_id"], name: "index_engagements_on_user_id"
  end

  create_table "managements", force: :cascade do |t|
    t.integer "role"
    t.integer "user_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_managements_on_property_id"
    t.index ["user_id"], name: "index_managements_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "type"
    t.string "identifier"
    t.integer "building_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_properties_on_building_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "terms"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "engagements", "buildings"
  add_foreign_key "engagements", "users"
  add_foreign_key "managements", "properties"
  add_foreign_key "managements", "users"
  add_foreign_key "properties", "buildings"
end
