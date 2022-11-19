# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_19_150449) do
  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_sauces", force: :cascade do |t|
    t.boolean "necessary", default: true
    t.integer "sauce_id"
    t.integer "ingredient_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pasta_sauces", force: :cascade do |t|
    t.boolean "appropriate", default: true
    t.integer "vote", default: 50
    t.text "notes"
    t.integer "pasta_id"
    t.integer "sauce_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pasta_id"], name: "index_pasta_sauces_on_pasta_id"
    t.index ["sauce_id"], name: "index_pasta_sauces_on_sauce_id"
  end

  create_table "pastas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sauces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.string "color", default: "rosso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
