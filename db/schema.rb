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

ActiveRecord::Schema.define(version: 2019_04_25_193954) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "web"
    t.float "cost"
    t.integer "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_activities_on_day_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.integer "trip_id"
    t.integer "lodging_id"
    t.float "expenses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lodging_id"], name: "index_days_on_lodging_id"
    t.index ["trip_id"], name: "index_days_on_trip_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "web"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.float "nightly_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "dep_airport"
    t.string "dep_time"
    t.string "arr_airport"
    t.string "arr_time"
    t.string "price"
    t.string "airline"
    t.string "reservation"
    t.integer "trip_id"
    t.index ["trip_id"], name: "index_tickets_on_trip_id"
  end

  create_table "travelers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.string "home_airport"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "beg_date"
    t.string "end_date"
    t.string "budget"
  end

  create_table "users_trips", force: :cascade do |t|
    t.boolean "admin"
    t.integer "user_id"
    t.integer "trip_id"
    t.index ["trip_id"], name: "index_users_trips_on_trip_id"
    t.index ["user_id"], name: "index_users_trips_on_user_id"
  end

end
