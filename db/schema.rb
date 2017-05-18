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

ActiveRecord::Schema.define(version: 20170515153201) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "question_id"
    t.string   "text_answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "plate_id"
    t.boolean  "prepared",                   default: false
    t.boolean  "cancelled",                  default: false, null: false
    t.boolean  "special",                    default: false
    t.text     "observations", limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["order_id"], name: "index_charges_on_order_id", using: :btree
    t.index ["plate_id"], name: "index_charges_on_plate_id", using: :btree
  end

  create_table "charges_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "charge_id"
    t.integer  "product_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["answer_id"], name: "index_charges_lines_on_answer_id", using: :btree
    t.index ["charge_id"], name: "index_charges_lines_on_charge_id", using: :btree
    t.index ["product_id"], name: "index_charges_lines_on_product_id", using: :btree
    t.index ["question_id"], name: "index_charges_lines_on_question_id", using: :btree
  end

  create_table "dishes_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "plate_id"
    t.integer  "product_id"
    t.float    "quantity",        limit: 24
    t.string   "unit_measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plate_id"], name: "index_dishes_products_on_plate_id", using: :btree
    t.index ["product_id"], name: "index_dishes_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "table_id"
    t.float    "amount",                limit: 24, default: 0.0
    t.boolean  "paid",                             default: false
    t.datetime "payment_time"
    t.boolean  "kitchen",                          default: false
    t.boolean  "cancelled",                        default: false, null: false
    t.datetime "delivery_time_kitchen"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["table_id"], name: "index_orders_on_table_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
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

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price",      limit: 24
    t.string   "unit_measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.string   "text_question"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["product_id"], name: "index_questions_on_product_id", using: :btree
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.float    "quantity",        limit: 24
    t.string   "unit_measure"
    t.date     "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["product_id"], name: "index_stocks_on_product_id", using: :btree
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
    t.boolean  "orders_view"
    t.boolean  "menu"
    t.boolean  "create_plate"
    t.boolean  "category"
    t.boolean  "tables"
    t.boolean  "orders_history"
    t.boolean  "products"
    t.boolean  "questions_answers"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["dni"], name: "index_users_on_dni", unique: true, using: :btree
    t.index ["mail"], name: "index_users_on_mail", unique: true, using: :btree
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "charges", "orders"
  add_foreign_key "charges", "plates"
  add_foreign_key "charges_lines", "answers"
  add_foreign_key "charges_lines", "charges"
  add_foreign_key "charges_lines", "products"
  add_foreign_key "charges_lines", "questions"
  add_foreign_key "dishes_products", "plates"
  add_foreign_key "dishes_products", "products"
  add_foreign_key "orders", "tables"
  add_foreign_key "orders", "users"
  add_foreign_key "plates", "categories"
  add_foreign_key "questions", "products"
  add_foreign_key "stocks", "products"
  add_foreign_key "users", "profiles"
end
