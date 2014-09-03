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

ActiveRecord::Schema.define(version: 20140903181536) do

  create_table "age_classes", force: true do |t|
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "age_classes_competitions", id: false, force: true do |t|
    t.integer "age_class_id"
    t.integer "competition_id"
  end

  create_table "competition_templates", force: true do |t|
    t.string   "title"
    t.string   "short_name"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "venue_id"
    t.integer  "competition_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["person_id"], name: "index_contacts_on_person_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "member_number"
    t.date     "entry"
    t.date     "exit"
    t.date     "entry_federation"
    t.date     "exit_federation"
    t.integer  "person_id"
    t.integer  "dad_id"
    t.integer  "mum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["member_number"], name: "index_members_on_member_number", using: :btree
  add_index "members", ["person_id"], name: "index_members_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.boolean  "gender"
    t.date     "birth_date"
    t.string   "birth_place"
    t.string   "street"
    t.integer  "zip"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nationality"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "activities"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "activation_token"
    t.boolean  "activated"
    t.integer  "person_id"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "zip"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
