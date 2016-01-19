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

ActiveRecord::Schema.define(version: 20160119030208) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "correct_answer", default: false
    t.integer  "test_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "grades", force: :cascade do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.text     "short_question"
    t.integer  "subject_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "login_attempts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "subject_id"
    t.integer  "test_id"
    t.integer  "question_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "picture"
  end

  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id"
  add_index "questions", ["test_id"], name: "index_questions_on_test_id"

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.integer  "duration"
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "time_info_id"
  end

  add_index "tests", ["subject_id"], name: "index_tests_on_subject_id"
  add_index "tests", ["user_id"], name: "index_tests_on_user_id"

  create_table "time_infos", force: :cascade do |t|
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_subjects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",                      default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "address"
    t.integer  "phone",            limit: 8
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "status",                     default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
