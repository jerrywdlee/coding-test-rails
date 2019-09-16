# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_15_191843) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id"
    t.string "phone"
    t.integer "prefecture_id"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["prefecture_id"], name: "index_addresses_on_prefecture_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name"
    t.index ["price"], name: "index_items_on_price"
  end

  create_table "items_tags", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "tag_id", null: false
    t.index ["item_id"], name: "index_items_tags_on_item_id"
    t.index ["tag_id"], name: "index_items_tags_on_tag_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer "sex"
    t.float "age"
    t.integer "sibsp", default: 0
    t.integer "pclass"
    t.float "fare"
    t.string "embark_town"
    t.boolean "survived"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["age"], name: "index_passengers_on_age"
    t.index ["embark_town"], name: "index_passengers_on_embark_town"
    t.index ["fare"], name: "index_passengers_on_fare"
    t.index ["pclass"], name: "index_passengers_on_pclass"
    t.index ["sex"], name: "index_passengers_on_sex"
    t.index ["sibsp"], name: "index_passengers_on_sibsp"
    t.index ["survived"], name: "index_passengers_on_survived"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "item_id"
    t.integer "address_id"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_purchases_on_address_id"
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["number"], name: "index_purchases_on_number"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "item_id"
    t.integer "customer_id"
    t.integer "score"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["item_id"], name: "index_reviews_on_item_id"
    t.index ["score"], name: "index_reviews_on_score"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  add_foreign_key "items_tags", "items"
  add_foreign_key "items_tags", "tags"
end
