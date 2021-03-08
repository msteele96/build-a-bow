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

ActiveRecord::Schema.define(version: 2021_03_02_210355) do

  create_table "bows", force: :cascade do |t|
    t.string "name"
    t.string "arrow_rest"
    t.string "arrow_head"
    t.string "arrow_shaft"
    t.string "front_sight"
    t.string "peep_sight"
    t.string "model"
    t.string "quiver"
    t.string "release"
    t.string "stabilizer"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
