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

ActiveRecord::Schema.define(version: 20170228221611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_outcomes", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "winner"
    t.string   "loser"
    t.string   "winning_score"
    t.string   "losing_score"
    t.string   "spread"
    t.integer  "player_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "game_outcome_id"
    t.index ["game_outcome_id"], name: "index_games_on_game_outcome_id", using: :btree
    t.index ["player_id"], name: "index_games_on_player_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "course"
    t.string   "semester"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "game_outcome_id"
    t.index ["email"], name: "index_players_on_email", unique: true, using: :btree
    t.index ["game_outcome_id"], name: "index_players_on_game_outcome_id", using: :btree
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "games", "game_outcomes"
  add_foreign_key "games", "players"
  add_foreign_key "players", "game_outcomes"
end
