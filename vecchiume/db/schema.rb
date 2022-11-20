# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100909210410) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredient_sauces", :force => true do |t|
    t.boolean  "necessary",     :default => true
    t.integer  "sauce_id"
    t.integer  "ingredient_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pasta_sauces", :force => true do |t|
    t.boolean  "appropriate", :default => true
    t.integer  "vote",        :default => 50
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pasta_id"
    t.integer  "sauce_id"
  end

  add_index "pasta_sauces", ["pasta_id"], :name => "index_pasta_sauces_on_pasta_id"
  add_index "pasta_sauces", ["sauce_id"], :name => "index_pasta_sauces_on_sauce_id"

  create_table "pastas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sauces", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",       :default => "rosso"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
    t.string   "likes",                                   :default => "chocolate, salmon, @meat"
    t.string   "dislikes",                                :default => "@vegetables, @tin_tuna"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
