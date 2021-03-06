# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140218140454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.datetime "date_of_visit",     null: false
    t.integer  "pet_id",            null: false
    t.integer  "user_id",           null: false
    t.string   "customer",          null: false
    t.boolean  "requires_reminder"
    t.string   "reason_for_visit",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "pets", force: true do |t|
    t.string   "name",                        null: false
    t.string   "pet_type",                    null: false
    t.string   "breed",                       null: false
    t.integer  "age",             default: 1
    t.string   "weight",                      null: false
    t.datetime "date_last_visit",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["name"], name: "index_pets_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "title",                  default: ""
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "address",                default: ""
    t.string   "city",                   default: ""
    t.string   "state",                  default: ""
    t.integer  "zip"
    t.string   "school",                 default: ""
    t.integer  "years_in_practice",      default: 1
    t.string   "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
