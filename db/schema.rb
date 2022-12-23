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

ActiveRecord::Schema[7.0].define(version: 2022_11_24_205458) do
  create_table "events", id: { limit: 8 }, force: :cascade do |t|
    t.string "name"
    t.time "created_at", null: false
    t.time "updated_at", null: false
  end

  create_table "ingredient_sauces", id: { limit: 8 }, force: :cascade do |t|
    t.boolean "necessary"
    t.integer "sauce_id", limit: 8
    t.integer "ingredient_id", limit: 8
    t.string "notes"
    t.time "created_at", null: false
    t.time "updated_at", null: false
  end

  create_table "ingredients", id: { limit: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "tags"
    t.time "created_at", null: false
    t.time "updated_at", null: false
    t.string "emoji"
  end

  create_table "pasta_sauces", id: { limit: 8 }, force: :cascade do |t|
    t.boolean "appropriate"
    t.integer "vote", limit: 8
    t.string "notes"
    t.integer "pasta_id", limit: 8
    t.integer "sauce_id", limit: 8
    t.time "created_at", null: false
    t.time "updated_at", null: false
    t.index ["pasta_id"], name: "index_pasta_sauces_on_pasta_id", order: { pasta_id: :asc }
    t.index ["sauce_id"], name: "index_pasta_sauces_on_sauce_id", order: { sauce_id: :asc }
  end

  create_table "pastas", id: { limit: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.time "created_at", null: false
    t.time "updated_at", null: false
    t.string "emoji"
  end

  create_table "sauces", id: { limit: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.string "color"
    t.time "created_at", null: false
    t.time "updated_at", null: false
    t.string "emoji"
  end

  create_table "users", id: { limit: 8 }, force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.time "reset_password_sent_at"
    t.time "remember_created_at"
    t.string "name"
    t.string "likes"
    t.string "dislikes"
    t.time "created_at", null: false
    t.time "updated_at", null: false
    t.boolean "admin", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true, order: { email: :asc }
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, order: { reset_password_token: :asc }
    t.index ["username"], name: "index_users_on_username", unique: true, order: { username: :asc }
  end

end
