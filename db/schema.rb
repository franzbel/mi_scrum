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

ActiveRecord::Schema.define(version: 20160529232747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptances", force: :cascade do |t|
    t.text     "criterion"
    t.integer  "user_story_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "acceptances", ["user_story_id"], name: "index_acceptances_on_user_story_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sprint_backlogs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
  end

  add_index "sprint_backlogs", ["product_id"], name: "index_sprint_backlogs_on_product_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "task"
    t.integer  "user_story_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tasks", ["user_story_id"], name: "index_tasks_on_user_story_id", using: :btree

  create_table "user_stories", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sprint_backlog_id"
    t.integer  "product_id"
  end

  add_index "user_stories", ["product_id"], name: "index_user_stories_on_product_id", using: :btree
  add_index "user_stories", ["sprint_backlog_id"], name: "index_user_stories_on_sprint_backlog_id", using: :btree

  add_foreign_key "acceptances", "user_stories"
  add_foreign_key "sprint_backlogs", "products"
  add_foreign_key "tasks", "user_stories"
  add_foreign_key "user_stories", "products"
  add_foreign_key "user_stories", "sprint_backlogs"
end
