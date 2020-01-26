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

ActiveRecord::Schema.define(version: 2020_01_24_215111) do

  create_table "families", force: :cascade do |t|
    t.string "surname"
    t.string "description"
    t.string "logo"
    t.string "color"
    t.string "photo"
  end

  create_table "familymembers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "married_last_name"
    t.string "gender"
    t.string "birth_date"
    t.string "death_date"
    t.string "home_town"
    t.string "photo1"
    t.string "photo2"
    t.integer "family_id"
    t.integer "user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "familymember_id"
    t.string "relation_type"
    t.string "description"
    t.integer "related_familymember_id"
    t.index ["related_familymember_id"], name: "index_relationships_on_related_familymember_id"
  end

end
