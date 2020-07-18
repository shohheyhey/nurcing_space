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

ActiveRecord::Schema.define(version: 2020_07_15_141841) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "office_id"
    t.string "name"
    t.datetime "created_at", default: "2020-07-16 07:36:51"
    t.datetime "updated_at", default: "2020-07-16 07:36:51"
    t.index ["office_id"], name: "index_categories_on_office_id"
  end

  create_table "customer_services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_services_on_customer_id"
    t.index ["service_id"], name: "index_customer_services_on_service_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "office_id", null: false
    t.bigint "category_id", null: false
    t.string "image"
    t.string "name"
    t.integer "age"
    t.date "birth"
    t.string "adress"
    t.integer "kaigodo"
    t.text "kioreki"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_customers_on_category_id"
    t.index ["office_id"], name: "index_customers_on_office_id"
    t.index ["service_id"], name: "index_customers_on_service_id"
  end

  create_table "offices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "tell"
    t.string "adress"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "office_id", null: false
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["office_id"], name: "index_services_on_office_id"
  end

  add_foreign_key "categories", "offices"
  add_foreign_key "customer_services", "customers"
  add_foreign_key "customer_services", "services"
  add_foreign_key "customers", "categories"
  add_foreign_key "customers", "offices"
  add_foreign_key "customers", "services"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "offices"
end
