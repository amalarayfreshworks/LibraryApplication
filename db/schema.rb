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

ActiveRecord::Schema.define(version: 20180317184732) do

  create_table "books", primary_key: "book_id", force: :cascade do |t|
    t.string "book_name"
    t.string "book_desc"
    t.string "book_category"
    t.boolean "book_avail_in_lib"
    t.boolean "book_damaged"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", primary_key: "reader_id", force: :cascade do |t|
    t.string "reader_name"
    t.string "reader_mobile_num"
    t.string "reader_email"
    t.datetime "membership_start_date"
    t.datetime "membership_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", primary_key: "transaction_id", force: :cascade do |t|
    t.datetime "issue_date_time"
    t.datetime "due_date_time"
    t.float "late_fee"
    t.integer "book_id"
    t.integer "reader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_transactions_on_book_id"
    t.index ["reader_id"], name: "index_transactions_on_reader_id"
  end

end
