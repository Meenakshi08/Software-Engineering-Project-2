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

ActiveRecord::Schema.define(version: 20141121153016) do

  create_table "airline_bookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.string   "source"
    t.string   "destination"
    t.string   "flight_no"
    t.string   "departure_time"
    t.string   "total_fare"
    t.integer  "airline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airlines", force: true do |t|
    t.integer  "user_id"
    t.string   "airline_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cab_bookings", force: true do |t|
    t.string   "source"
    t.string   "destination"
    t.string   "pickup_date"
    t.string   "pickup_time"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registered_apps", force: true do |t|
    t.string   "Name"
    t.string   "Type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "agent_id"
    t.string   "email"
    t.string   "post"
    t.text     "address"
    t.integer  "contact"
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "cab",                default: false
    t.boolean  "bus",                default: false
    t.boolean  "train",              default: false
    t.boolean  "flight",             default: false
    t.boolean  "hotel",              default: false
    t.string   "password"
    t.string   "wpass"
  end

end
