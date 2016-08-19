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

ActiveRecord::Schema.define(version: 20160819171122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "pokemons", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "move_1"
    t.integer  "move_2"
    t.integer  "captured_cell_id"
    t.integer  "pokeball"
    t.integer  "pokemon_id"
    t.integer  "creation_time_ms"
    t.float    "height_m"
    t.integer  "stamina_max"
    t.float    "weight_kg"
    t.integer  "individual_defense"
    t.integer  "individual_stamina"
    t.integer  "individual_attack"
    t.integer  "cp"
    t.integer  "stamina"
    t.float    "cp_multiplier"
    t.integer  "pgo_id"
    t.integer  "from_fort"
    t.string   "nickname"
    t.integer  "battles_attacked"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
