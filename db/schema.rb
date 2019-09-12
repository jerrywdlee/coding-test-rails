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

ActiveRecord::Schema.define(version: 2019_09_12_095023) do

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

end
