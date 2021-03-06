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

ActiveRecord::Schema.define(version: 20151013221739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "slug"
    t.text     "content"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "tag_slugs",  default: [],              array: true
  end

  add_index "articles", ["tag_slugs"], name: "index_articles_on_tag_slugs", using: :gin

  create_table "assets", force: :cascade do |t|
    t.text     "filename"
    t.text     "content_type"
    t.integer  "file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "assets", ["assetable_type", "assetable_id"], name: "index_assets_on_assetable_type_and_assetable_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "author_name",  default: "Anonymous"
    t.text     "author_email", default: "anonymous@dot.com"
    t.text     "content"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "comments", ["target_type", "target_id"], name: "index_comments_on_target_type_and_target_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.text     "address"
    t.datetime "started_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "tag_slugs",  default: [],              array: true
  end

  add_index "events", ["tag_slugs"], name: "index_events_on_tag_slugs", using: :gin

  create_table "posts", force: :cascade do |t|
    t.text     "title"
    t.text     "slug"
    t.text     "content"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "tag_slugs",  default: [],              array: true
    t.hstore   "settings",   default: {}, null: false
  end

  add_index "posts", ["tag_slugs"], name: "index_posts_on_tag_slugs", using: :gin

  create_table "tags", force: :cascade do |t|
    t.text     "slug"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
