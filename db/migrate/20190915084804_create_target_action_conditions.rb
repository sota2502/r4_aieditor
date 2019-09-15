class CreateTargetActionConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :target_action_conditions do |t|
      t.integer :hp_condition_id
      t.references :search_range, null: false, foreign_key: true
      t.integer :target_type_id
      t.integer :target_motion_id
      t.references :probability, null: false, foreign_key: true
      t.float :probability_coefficient
      t.integer :previous_cancel_type
      t.references :action_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
