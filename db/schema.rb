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

ActiveRecord::Schema.define(version: 2019_09_15_055909) do

  create_table "action_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "action_rules", force: :cascade do |t|
    t.integer "action_group_id", null: false
    t.integer "action_type_id"
    t.integer "next_act_timing_id"
    t.integer "holding_time"
    t.float "velocity_x"
    t.float "velocity_y"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_group_id"], name: "index_action_rules_on_action_group_id"
  end

  create_table "cancel_conditions", force: :cascade do |t|
    t.integer "action_rule_id", null: false
    t.integer "cancel_type_id"
    t.integer "probability_id", null: false
    t.float "probability_coefficient"
    t.float "parameter1"
    t.float "parameter2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_rule_id"], name: "index_cancel_conditions_on_action_rule_id"
    t.index ["probability_id"], name: "index_cancel_conditions_on_probability_id"
  end

  create_table "probabilities", force: :cascade do |t|
    t.string "name", null: false
    t.float "default_value"
    t.float "correction_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "search_ranges", force: :cascade do |t|
    t.string "name", null: false
    t.float "left"
    t.float "top"
    t.float "right"
    t.float "bottom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "action_rules", "action_groups"
  add_foreign_key "cancel_conditions", "action_rules"
  add_foreign_key "cancel_conditions", "probabilities"
end
