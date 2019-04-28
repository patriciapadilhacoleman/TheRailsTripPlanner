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

ActiveRecord::Schema.define(version: 2019_04_28_030738) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "phone"
    t.string "email"
    t.string "web"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.float "cost"
    t.integer "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.string "location"
    t.integer "trip_id"
    t.integer "lodging_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "phone"
    t.string "email"
    t.string "web"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "description"
    t.integer "no_of_guests"
    t.string "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "dep_airport"
    t.datetime "dep_time"
    t.string "arr_airport"
    t.datetime "arr_time"
    t.float "price"
    t.string "airline"
    t.string "reservation"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.date "beg_date"
    t.date "end_date"
    t.float "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "trip_id"
    t.boolean "admin"
    t.index ["trip_id"], name: "index_trips_users_on_trip_id"
    t.index ["user_id"], name: "index_trips_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.string "home_airport"
    t.string "phone"
    t.string "email"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "provider"
    t.string "uid"
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["uid"], name: "index_users_on_uid"
  end

end
