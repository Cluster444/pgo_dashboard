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

ActiveRecord::Schema.define(version: 20160822041905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "poke_auths", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "auth_type"
    t.string   "login_name"
    t.uuid     "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "display_name"
    t.boolean  "default"
    t.index ["user_id"], name: "index_poke_auths_on_user_id", using: :btree
  end

  create_table "pokemon_refs", id: :integer, force: :cascade do |t|
    t.string   "name"
    t.integer  "stamina"
    t.integer  "attack"
    t.integer  "defense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "move_1"
    t.integer  "move_2"
    t.decimal  "captured_cell_id",         precision: 20
    t.integer  "pokeball"
    t.integer  "pokemon_id"
    t.bigint   "creation_time_ms"
    t.float    "height_m"
    t.integer  "stamina_max"
    t.float    "weight_kg"
    t.integer  "individual_defense"
    t.integer  "individual_stamina"
    t.integer  "individual_attack"
    t.integer  "cp"
    t.integer  "stamina"
    t.float    "additional_cp_multiplier"
    t.float    "cp_multiplier"
    t.decimal  "pgo_id",                   precision: 20
    t.integer  "num_upgrades"
    t.integer  "from_fort"
    t.integer  "favorite"
    t.string   "nickname"
    t.integer  "battles_attacked"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "battles_defended"
    t.string   "deployed_fort_id"
    t.uuid     "user_id"
    t.uuid     "poke_auth_id"
    t.index ["poke_auth_id"], name: "index_pokemons_on_poke_auth_id", using: :btree
    t.index ["user_id"], name: "index_pokemons_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "auth_type"
    t.string   "location"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "poke_auths", "users"
  add_foreign_key "pokemons", "poke_auths"
  add_foreign_key "pokemons", "users"
end
