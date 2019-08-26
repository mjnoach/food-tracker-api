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

ActiveRecord::Schema.define(version: 2019_08_26_164157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["name", "user_id"], name: "index_food_items_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_food_items_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "food_item_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_ingredients_on_food_item_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "day"
    t.index ["id", "user_id"], name: "index_meals_on_id_and_user_id", unique: true
    t.index ["recipe_id"], name: "index_meals_on_recipe_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["name", "user_id"], name: "index_recipes_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "food_items", "users"
  add_foreign_key "ingredients", "food_items"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "meals", "recipes"
  add_foreign_key "meals", "users"
  add_foreign_key "recipes", "users"
end
