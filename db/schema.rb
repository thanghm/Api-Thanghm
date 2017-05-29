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

ActiveRecord::Schema.define(version: 20170529091905) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "letter",     limit: 255
  end

  create_table "matches", force: :cascade do |t|
    t.string   "match_code",            limit: 255
    t.string   "venue",                 limit: 255
    t.datetime "datetime"
    t.datetime "date"
    t.integer  "home_player_id",        limit: 4
    t.integer  "away_player_id",        limit: 4
    t.string   "home_player_tbd",       limit: 255
    t.string   "away_player_tbd",       limit: 255
    t.boolean  "players_scheduled",     limit: 1
    t.integer  "home_player_score",     limit: 4
    t.integer  "away_player_score",     limit: 4
    t.integer  "status",                limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_player_penalties", limit: 4
    t.integer  "away_player_penalties", limit: 4
    t.integer  "player_id_gave_up",     limit: 4
  end

  create_table "players", force: :cascade do |t|
    t.string   "player_name",    limit: 255
    t.string   "alternate_name", limit: 255
    t.integer  "group_id",       limit: 4
    t.integer  "wins",           limit: 4
    t.integer  "draws",          limit: 4
    t.integer  "losses",         limit: 4
    t.integer  "goals_for",      limit: 4
    t.integer  "goals_against",  limit: 4
    t.boolean  "knocked_out",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id",      limit: 4
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "authentication_token",   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
