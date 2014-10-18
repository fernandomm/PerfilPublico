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

ActiveRecord::Schema.define(version: 20141018140440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.text     "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "party_id"
  end

  add_index "candidates", ["party_id"], name: "index_candidates_on_party_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.integer  "promise_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  add_index "links", ["promise_id"], name: "index_links_on_promise_id", using: :btree

  create_table "parties", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promises", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.integer  "up_votes"
    t.integer  "down_votes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
    t.string   "status"
    t.date     "date"
  end

  add_index "promises", ["candidate_id"], name: "index_promises_on_candidate_id", using: :btree
  add_index "promises", ["category_id"], name: "index_promises_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
