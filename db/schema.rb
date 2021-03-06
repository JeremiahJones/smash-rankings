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

ActiveRecord::Schema.define(version: 20180308045835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "miom_rankings", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "year"
    t.float "score"
    t.string "change"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_miom_rankings_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "gamer_tag"
    t.string "country"
    t.string "first_name"
    t.string "last_name"
    t.string "characters", default: [], array: true
    t.string "youtube"
    t.string "twitter"
    t.string "twitch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
