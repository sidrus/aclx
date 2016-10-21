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

ActiveRecord::Schema.define(version: 20161021011521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "aclx_id"
    t.boolean  "id_issued"
    t.string   "forum_name"
    t.string   "full_name"
    t.string   "email"
    t.string   "vehicle_desc"
    t.date     "date_joined"
    t.boolean  "has_facebook"
    t.text     "comments"
    t.date     "last_activity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "type"
    t.boolean  "is_leadership"
    t.boolean  "inactive"
  end

  create_table "vehicle_colors", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_colors_on_vehicle_id", using: :btree
  end

  create_table "vehicle_editions", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_editions_on_vehicle_id", using: :btree
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_models_on_vehicle_id", using: :btree
  end

  create_table "vehicle_trims", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_trims_on_vehicle_id", using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "nickname"
    t.integer  "user_id"
    t.integer  "color_id"
    t.integer  "edition_id"
    t.integer  "trim_id"
    t.integer  "model_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "is_primary"
    t.integer  "vehicle_year"
    t.index ["user_id"], name: "index_vehicles_on_user_id", using: :btree
  end

  add_foreign_key "vehicle_editions", "vehicles"
  add_foreign_key "vehicle_models", "vehicles"
  add_foreign_key "vehicle_trims", "vehicles"
  add_foreign_key "vehicle_colors", "vehicles"
  add_foreign_key "vehicles", "users"
end
