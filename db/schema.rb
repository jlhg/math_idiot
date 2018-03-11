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

ActiveRecord::Schema.define(version: 20180311064701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.index ["user_id", "name"], name: "index_participants_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "line_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_key"], name: "index_users_on_line_key", unique: true
  end

  add_foreign_key "participants", "users"
end
