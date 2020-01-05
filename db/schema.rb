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

ActiveRecord::Schema.define(version: 2020_01_05_221826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_preferences", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activity_preferences_on_user_id"
  end

  create_table "buddies", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buddies_on_user_id"
  end

  create_table "daily_feelings", force: :cascade do |t|
    t.string "feeling"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_daily_feelings_on_user_id"
  end

  create_table "dbt_quotes", force: :cascade do |t|
    t.text "quote"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "activity"
    t.boolean "helpful"
    t.boolean "again"
    t.boolean "shift"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "feeling_categories", force: :cascade do |t|
    t.string "category"
    t.bigint "user_id"
    t.bigint "feeling_preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feeling_preference_id"], name: "index_feeling_categories_on_feeling_preference_id"
    t.index ["user_id"], name: "index_feeling_categories_on_user_id"
  end

  create_table "feeling_preferences", force: :cascade do |t|
    t.string "feeling"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feeling_preferences_on_user_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.text "entry"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journal_entries_on_user_id"
  end

  create_table "media_preferences", force: :cascade do |t|
    t.boolean "dogs", default: false
    t.boolean "cats", default: false
    t.boolean "babies", default: false
    t.boolean "landscapes", default: false
    t.boolean "celestial", default: false
    t.boolean "animals", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_media_preferences_on_user_id"
  end

  create_table "music_preferences", force: :cascade do |t|
    t.string "genre"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_music_preferences_on_user_id"
  end

  create_table "time_preferences", force: :cascade do |t|
    t.boolean "morning", default: false
    t.boolean "midday", default: false
    t.boolean "before_bed", default: false
    t.boolean "random", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_time_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "google_token"
    t.string "spotify_token"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "survey?", default: false
  end

  add_foreign_key "activity_preferences", "users"
  add_foreign_key "buddies", "users"
  add_foreign_key "daily_feelings", "users"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "feeling_categories", "feeling_preferences"
  add_foreign_key "feeling_categories", "users"
  add_foreign_key "feeling_preferences", "users"
  add_foreign_key "journal_entries", "users"
  add_foreign_key "media_preferences", "users"
  add_foreign_key "music_preferences", "users"
  add_foreign_key "time_preferences", "users"
end
