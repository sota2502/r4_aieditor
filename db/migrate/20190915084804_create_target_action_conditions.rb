class CreateTargetActionConditions < ActiveRecord::Migration[6.0]
  def up
    create_table :target_action_conditions do |t|
      t.references :ai_routine, null: false, foreign_key: true, index: false
      t.integer :hp_condition_id, null: false
      t.references :search_range, null: false, foreign_key: true
      t.integer :target_type_id
      t.integer :target_motion_id
      t.references :probability, null: true, foreign_key: true
      t.float :probability_coefficient
      t.integer :previous_cancel_type
      t.references :action_group, null: false, foreign_key: true

      t.timestamps
    end
    add_index :target_action_conditions, [:ai_routine_id, :hp_condition_id],
              unique: true,
              name: :index_ai_routine_and_hp_condition
  end

  def down
    remove_index :target_action_conditions, column: [:ai_routine_id, :hp_condition_id]
    drop_table :target_action_conditions
  end
end
