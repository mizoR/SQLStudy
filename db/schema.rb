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

ActiveRecord::Schema.define(version: 20150323231931) do

  create_table "course_masters", id: false, force: :cascade do |t|
    t.integer "course_id",   limit: 4,   null: false
    t.string  "course_name", limit: 255, null: false
  end

  create_table "open_courses", id: false, force: :cascade do |t|
    t.integer "month",     limit: 4, null: false
    t.integer "course_id", limit: 4, null: false
  end

  create_table "pop_tbl2s", id: false, force: :cascade do |t|
    t.string  "pref_name",  limit: 255, null: false
    t.integer "sex",        limit: 4,   null: false
    t.integer "population", limit: 4,   null: false
  end

  create_table "pop_tbls", id: false, force: :cascade do |t|
    t.string  "pref_name",  limit: 255, null: false
    t.integer "population", limit: 4,   null: false
  end

  create_table "student_clubs", id: false, force: :cascade do |t|
    t.integer "std_id",        limit: 4,   null: false
    t.integer "club_id",       limit: 4,   null: false
    t.string  "club_name",     limit: 255, null: false
    t.boolean "main_club_flg", limit: 1,   null: false
  end

end
