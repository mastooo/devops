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

ActiveRecord::Schema.define(version: 20140318061514) do

  create_table "commits", force: true do |t|
    t.string   "hash"
    t.text     "message"
    t.integer  "member_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commits", ["member_id"], name: "index_commits_on_member_id"
  add_index "commits", ["user_id"], name: "index_commits_on_user_id"

  create_table "deployments", force: true do |t|
    t.string   "commit_hash"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deployments", ["user_id"], name: "index_deployments_on_user_id"

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "github_id"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "provider"
    t.string   "token"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
    t.string   "organization_id"
    t.string   "organization_name"
    t.string   "api_token"
    t.string   "repo"
  end

end
