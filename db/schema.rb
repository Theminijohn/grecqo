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

ActiveRecord::Schema.define(version: 20141002165311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alliances", primary_key: "grepo_id", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.integer  "town_count"
    t.integer  "member_count"
    t.integer  "rank"
    t.integer  "all_rank"
    t.integer  "all_points"
    t.integer  "def_rank"
    t.integer  "def_points"
    t.integer  "att_rank"
    t.integer  "att_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alliances", ["all_rank"], name: "index_alliances_on_all_rank", using: :btree
  add_index "alliances", ["att_points"], name: "index_alliances_on_att_points", using: :btree
  add_index "alliances", ["att_rank"], name: "index_alliances_on_att_rank", using: :btree
  add_index "alliances", ["def_points"], name: "index_alliances_on_def_points", using: :btree
  add_index "alliances", ["def_rank"], name: "index_alliances_on_def_rank", using: :btree
  add_index "alliances", ["grepo_id"], name: "index_alliances_on_grepo_id", using: :btree
  add_index "alliances", ["member_count"], name: "index_alliances_on_member_count", using: :btree
  add_index "alliances", ["name"], name: "index_alliances_on_name", using: :btree
  add_index "alliances", ["points"], name: "index_alliances_on_points", using: :btree
  add_index "alliances", ["rank"], name: "index_alliances_on_rank", using: :btree
  add_index "alliances", ["town_count"], name: "index_alliances_on_town_count", using: :btree

  create_table "conquers", force: true do |t|
    t.integer  "town_id"
    t.integer  "time"
    t.integer  "new_player_id"
    t.integer  "old_player_id"
    t.integer  "new_ally_id"
    t.integer  "old_ally_id"
    t.integer  "town_points"
    t.boolean  "intern",            default: false
    t.string   "old_player_name"
    t.string   "old_alliance_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conquers", ["intern"], name: "index_conquers_on_intern", using: :btree
  add_index "conquers", ["new_ally_id"], name: "index_conquers_on_new_ally_id", using: :btree
  add_index "conquers", ["new_player_id"], name: "index_conquers_on_new_player_id", using: :btree
  add_index "conquers", ["old_ally_id"], name: "index_conquers_on_old_ally_id", using: :btree
  add_index "conquers", ["old_player_id"], name: "index_conquers_on_old_player_id", using: :btree
  add_index "conquers", ["town_id"], name: "index_conquers_on_town_id", using: :btree
  add_index "conquers", ["town_points"], name: "index_conquers_on_town_points", using: :btree

  create_table "players", primary_key: "grepo_id", force: true do |t|
    t.string   "name"
    t.integer  "alliance_id"
    t.integer  "points"
    t.integer  "rank"
    t.integer  "town_count"
    t.integer  "all_rank"
    t.integer  "all_points"
    t.integer  "def_rank"
    t.integer  "def_points"
    t.integer  "att_rank"
    t.integer  "att_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["all_points"], name: "index_players_on_all_points", using: :btree
  add_index "players", ["all_rank"], name: "index_players_on_all_rank", using: :btree
  add_index "players", ["alliance_id"], name: "index_players_on_alliance_id", using: :btree
  add_index "players", ["att_points"], name: "index_players_on_att_points", using: :btree
  add_index "players", ["att_rank"], name: "index_players_on_att_rank", using: :btree
  add_index "players", ["def_points"], name: "index_players_on_def_points", using: :btree
  add_index "players", ["def_rank"], name: "index_players_on_def_rank", using: :btree
  add_index "players", ["grepo_id"], name: "index_players_on_grepo_id", using: :btree
  add_index "players", ["name"], name: "index_players_on_name", using: :btree
  add_index "players", ["points"], name: "index_players_on_points", using: :btree
  add_index "players", ["rank"], name: "index_players_on_rank", using: :btree
  add_index "players", ["town_count"], name: "index_players_on_town_count", using: :btree

  create_table "towns", primary_key: "grepo_id", force: true do |t|
    t.integer  "player_id"
    t.string   "name"
    t.integer  "island_x"
    t.integer  "island_y"
    t.integer  "slot"
    t.integer  "points"
    t.string   "ocean"
    t.string   "coordinates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "towns", ["coordinates"], name: "index_towns_on_coordinates", using: :btree
  add_index "towns", ["grepo_id"], name: "index_towns_on_grepo_id", using: :btree
  add_index "towns", ["island_x"], name: "index_towns_on_island_x", using: :btree
  add_index "towns", ["island_y"], name: "index_towns_on_island_y", using: :btree
  add_index "towns", ["ocean"], name: "index_towns_on_ocean", using: :btree
  add_index "towns", ["player_id"], name: "index_towns_on_player_id", using: :btree
  add_index "towns", ["points"], name: "index_towns_on_points", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
