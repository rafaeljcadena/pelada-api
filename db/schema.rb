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

ActiveRecord::Schema.define(version: 20170525023353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "complement"
    t.string   "cep"
    t.string   "city"
    t.string   "state"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["player_id"], name: "index_addresses_on_player_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "pelada_soccer_teams", force: :cascade do |t|
    t.integer  "pelada_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pelada_id"], name: "index_pelada_soccer_teams_on_pelada_id", using: :btree
  end

  create_table "peladas", force: :cascade do |t|
    t.string   "title"
    t.datetime "begin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "host_id"
    t.integer  "guest_id"
    t.string   "address"
    t.decimal  "lat"
    t.decimal  "lng"
    t.index ["guest_id"], name: "index_peladas_on_guest_id", using: :btree
    t.index ["host_id"], name: "index_peladas_on_host_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "nome"
    t.date     "birthdate"
    t.string   "cpf"
    t.text     "descricao"
    t.boolean  "active"
    t.string   "position"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email"
    t.integer  "soccer_team_id"
    t.index ["soccer_team_id"], name: "index_players_on_soccer_team_id", using: :btree
  end

  create_table "soccer_teams", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "team_name"
    t.integer  "fouls_commited",         default: 0
    t.integer  "vacancy_users"
    t.boolean  "open_for_subscriptions", default: false
    t.integer  "goals_scored",           default: 0
    t.integer  "red_cards",              default: 0
    t.integer  "yellow_cards",           default: 0
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.date     "birthdate"
    t.string   "cpf"
    t.text     "descricao"
    t.boolean  "active"
    t.string   "position"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.integer  "soccer_team_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["soccer_team_id"], name: "index_users_on_soccer_team_id", using: :btree
  end

  add_foreign_key "addresses", "players"
  add_foreign_key "addresses", "users"
  add_foreign_key "pelada_soccer_teams", "peladas"
  add_foreign_key "players", "soccer_teams"
  add_foreign_key "users", "soccer_teams"
end
