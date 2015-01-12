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

ActiveRecord::Schema.define(version: 20150112140748) do

  create_table "mmc_categories", force: :cascade do |t|
    t.integer  "mmc_vendor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  add_index "mmc_categories", ["mmc_vendor_id"], name: "index_mmc_categories_on_mmc_vendor_id"

  create_table "mmc_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "mmc_placement_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "mmc_items", ["mmc_placement_id"], name: "index_mmc_items_on_mmc_placement_id"

  create_table "mmc_placements", force: :cascade do |t|
    t.string   "name"
    t.integer  "mmc_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "mmc_placements", ["mmc_category_id"], name: "index_mmc_placements_on_mmc_category_id"

  create_table "mmc_vendors", force: :cascade do |t|
    t.integer  "promo_code_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  add_index "mmc_vendors", ["promo_code_id"], name: "index_mmc_vendors_on_promo_code_id"

  create_table "promo_codes", force: :cascade do |t|
    t.string   "base_url"
    t.string   "friendly_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
