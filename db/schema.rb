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

ActiveRecord::Schema.define(version: 2019_11_09_150816) do

  create_table "action_chain_cancels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "action_chain_id", null: false
    t.bigint "cancel_condition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_chain_id"], name: "index_action_chain_cancels_on_action_chain_id"
    t.index ["cancel_condition_id"], name: "index_action_chain_cancels_on_cancel_condition_id"
  end

  create_table "action_chains", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_action_chains_on_project_id"
  end

  create_table "action_routines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "hp_condition_id", null: false
    t.bigint "search_id", null: false
    t.integer "target_value"
    t.integer "motion_id"
    t.bigint "rate_id"
    t.float "rate_coefficient", unsigned: true
    t.integer "cancel_type_id"
    t.bigint "action_chain_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_chain_id"], name: "index_action_routines_on_action_chain_id"
    t.index ["hp_condition_id"], name: "index_action_routines_on_hp_condition_id"
    t.index ["rate_id"], name: "index_action_routines_on_rate_id"
    t.index ["search_id"], name: "index_action_routines_on_search_id"
  end

  create_table "action_rule_cancels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "action_rule_id", null: false
    t.bigint "cancel_condition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_rule_id"], name: "index_action_rule_cancels_on_action_rule_id"
    t.index ["cancel_condition_id"], name: "index_action_rule_cancels_on_cancel_condition_id"
  end

  create_table "action_rules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "action_chain_id", null: false
    t.integer "motion_id"
    t.float "move_x"
    t.float "move_y"
    t.integer "next", null: false
    t.bigint "search_id", null: false
    t.integer "target_value"
    t.integer "hold", unsigned: true
    t.integer "way_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_chain_id"], name: "index_action_rules_on_action_chain_id"
    t.index ["search_id"], name: "index_action_rules_on_search_id"
  end

  create_table "action_states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "chara"
    t.string "field"
    t.integer "freq", unsigned: true
    t.integer "precis", unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_action_states_on_project_id"
  end

  create_table "cancel_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "cancel_type_id", null: false
    t.bigint "rate_id"
    t.float "rate_coefficient", unsigned: true
    t.integer "parameter1"
    t.integer "parameter2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_cancel_conditions_on_project_id"
    t.index ["rate_id"], name: "index_cancel_conditions_on_rate_id"
  end

  create_table "exactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_exactions_on_project_id"
  end

  create_table "hp_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "exaction_id", null: false
    t.integer "value", null: false, unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exaction_id"], name: "index_hp_conditions_on_exaction_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "action_state_id", null: false
    t.string "name"
    t.float "value", unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_state_id"], name: "index_rates_on_action_state_id"
  end

  create_table "searches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "action_state_id", null: false
    t.string "name"
    t.integer "x1"
    t.integer "y1"
    t.integer "x2"
    t.integer "y2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_state_id"], name: "index_searches_on_action_state_id"
  end

  create_table "targets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "action_state_id", null: false
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_state_id"], name: "index_targets_on_action_state_id"
  end

  add_foreign_key "action_chain_cancels", "action_chains"
  add_foreign_key "action_chain_cancels", "cancel_conditions"
  add_foreign_key "action_chains", "projects"
  add_foreign_key "action_routines", "action_chains"
  add_foreign_key "action_routines", "hp_conditions"
  add_foreign_key "action_routines", "rates"
  add_foreign_key "action_routines", "searches"
  add_foreign_key "action_rule_cancels", "action_rules"
  add_foreign_key "action_rule_cancels", "cancel_conditions"
  add_foreign_key "action_rules", "action_chains"
  add_foreign_key "action_rules", "searches"
  add_foreign_key "action_states", "projects"
  add_foreign_key "actions", "action_chains"
  add_foreign_key "actions", "hp_conditions"
  add_foreign_key "actions", "rates"
  add_foreign_key "actions", "searches"
  add_foreign_key "cancel_conditions", "projects"
  add_foreign_key "cancel_conditions", "rates"
  add_foreign_key "exactions", "projects"
  add_foreign_key "hp_conditions", "exactions"
  add_foreign_key "rates", "action_states"
  add_foreign_key "searches", "action_states"
  add_foreign_key "targets", "action_states"
end
