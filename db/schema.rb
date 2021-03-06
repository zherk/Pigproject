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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111228124637) do

  create_table "abstract_users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "deposits", :force => true do |t|
    t.integer  "user_id",                                   :null => false
    t.decimal  "amount",      :precision => 8, :scale => 2, :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                 :null => false
    t.integer  "order_id",                                   :null => false
    t.integer  "quantity",                                   :null => false
    t.decimal  "total_price",  :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buy_price_id"
  end

  create_table "orders", :force => true do |t|
    t.integer "user_id", :null => false
  end

  create_table "prices", :force => true do |t|
    t.decimal  "value"
    t.integer  "product_id", :null => false
    t.text     "type",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                :precision => 8, :scale => 2, :default => 0.0
    t.integer  "stock",                                              :default => 0
    t.integer  "active_sell_price_id"
    t.integer  "active_buy_price_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
