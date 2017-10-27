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

ActiveRecord::Schema.define(version: 20170919160345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tests", force: :cascade do |t|
    t.integer  "words_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["words_id"], name: "index_tests_on_words_id", using: :btree
  end

  create_table "words", force: :cascade do |t|
    t.string   "character"
    t.string   "meaning"
    t.string   "pinyin"
    t.string   "part_of_speech"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "mnemonic"
    t.index ["meaning"], name: "index_words_on_meaning", using: :btree
    t.index ["part_of_speech"], name: "index_words_on_part_of_speech", using: :btree
  end

  create_table "words_tested", force: :cascade do |t|
    t.integer  "tests_id"
    t.integer  "words_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tests_id"], name: "index_words_tested_on_tests_id", using: :btree
    t.index ["words_id"], name: "index_words_tested_on_words_id", using: :btree
  end

  add_foreign_key "tests", "words", column: "words_id"
  add_foreign_key "words_tested", "tests", column: "tests_id"
  add_foreign_key "words_tested", "words", column: "words_id"
end
