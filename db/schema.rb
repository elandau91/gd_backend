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

ActiveRecord::Schema.define(version: 2020_09_22_152804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_shows", force: :cascade do |t|
    t.integer "user_id"
    t.string "show_id"
    t.string "content"
    t.index ["show_id"], name: "index_comment_shows_on_show_id"
  end

  create_table "fave_shows", force: :cascade do |t|
    t.integer "user_id"
    t.string "show_id"
    t.index ["show_id"], name: "index_fave_shows_on_show_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
  end

  create_table "show_sets", id: false, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "show_uuid"
    t.integer "position"
    t.boolean "encore", default: false
  end

  create_table "shows", id: false, force: :cascade do |t|
    t.string "uuid", null: false
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.integer "position"
    t.string "venue"
    t.string "city"
    t.string "state"
    t.string "country"
    t.index ["uuid", "year", "month", "day"], name: "index_shows_on_uuid_and_year_and_month_and_day"
  end

  create_table "song_occurences", id: false, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "show_uuid"
    t.string "song_ref_uuid"
    t.integer "position"
    t.index ["uuid", "song_ref_uuid"], name: "index_song_occurences_on_uuid_and_song_ref_uuid"
  end

  create_table "song_refs", id: false, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "name"
    t.string "slug"
    t.integer "song_occurences_count", default: 0
    t.index ["uuid", "name", "slug"], name: "index_song_refs_on_uuid_and_name_and_slug"
  end

  create_table "songs", id: false, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "show_set_uuid"
    t.string "song_ref_uuid"
    t.integer "position"
    t.boolean "segued"
    t.index ["uuid", "song_ref_uuid"], name: "index_songs_on_uuid_and_song_ref_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "avatar"
  end

end
