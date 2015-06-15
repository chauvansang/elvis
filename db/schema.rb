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

ActiveRecord::Schema.define(version: 20150615095125) do

  create_table "timeslots", force: :cascade do |t|
    t.string   "acad_year"
    t.string   "class_number"
    t.integer  "day"
    t.time     "start"
    t.time     "end"
    t.string   "type"
    t.string   "module_code"
    t.integer  "semester"
    t.string   "venue"
    t.string   "week_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "index"
    t.string   "email"
    t.string   "unique"
    t.string   "gender"
    t.string   "faculty"
    t.string   "first_major"
    t.string   "second_major"
    t.integer  "matric_year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
