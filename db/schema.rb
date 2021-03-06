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

ActiveRecord::Schema.define(version: 20160116141040) do

  create_table "action_items", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "sretro_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "action_items", ["sretro_id"], name: "index_action_items_on_sretro_id", using: :btree

  create_table "note_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "notes",        limit: 255
    t.integer  "notes_type",   limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "note_type_id", limit: 4
    t.integer  "sretro_id",    limit: 4
    t.integer  "vote",         limit: 4,   default: 0
  end

  add_index "notes", ["note_type_id"], name: "index_notes_on_note_type_id", using: :btree
  add_index "notes", ["sretro_id"], name: "index_notes_on_sretro_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "sretros", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "style",      limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id",    limit: 4
    t.integer  "team_id",    limit: 4
    t.integer  "is_pending", limit: 4,   default: 1, null: false
  end

  add_index "sretros", ["team_id"], name: "index_sretros_on_team_id", using: :btree
  add_index "sretros", ["title"], name: "index_sretros_on_title", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "is_team_lead"
    t.integer  "team_id",                limit: 4,   default: 0,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["is_team_lead"], name: "index_users_on_is_team_lead", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "action_items", "sretros"
  add_foreign_key "notes", "note_types"
  add_foreign_key "notes", "sretros"
  add_foreign_key "notes", "users"
  add_foreign_key "sretros", "teams"
end
