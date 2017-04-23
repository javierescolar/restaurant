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

ActiveRecord::Schema.define(version: 20170402200032) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "table_id"
    t.float    "amount",     limit: 24, default: 0.0
    t.boolean  "paid",                  default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["table_id"], name: "index_orders_on_table_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "orders_plates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "plate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "my_index_order_on_plate", using: :btree
    t.index ["plate_id"], name: "my_index_plate_on_order", using: :btree
  end

  create_table "plates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description", limit: 65535
    t.float    "price",       limit: 24
    t.string   "photo"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_plates_on_category_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number"
    t.integer  "capacity"
    t.boolean  "free",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "profile_id"
    t.string   "dni"
    t.string   "name"
    t.string   "surnames"
    t.date     "birthdate"
    t.integer  "phone_1"
    t.integer  "phone_2"
    t.string   "mail"
    t.string   "password"
    t.boolean  "orders"
    t.boolean  "menu"
    t.boolean  "create_plate"
    t.boolean  "category"
    t.boolean  "tables"
    t.boolean  "orders_history"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["dni"], name: "index_users_on_dni", unique: true, using: :btree
    t.index ["mail"], name: "index_users_on_mail", unique: true, using: :btree
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
  end

  add_foreign_key "orders", "tables"
  add_foreign_key "orders", "users"
  add_foreign_key "plates", "categories"
  add_foreign_key "users", "profiles"
end
