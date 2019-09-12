class CreateActionRules < ActiveRecord::Migration[6.0]
  def change
    create_table :action_rules do |t|
      t.references :action_group, null: false, foreign_key: true
      t.integer :action_type_id
      t.integer :next_act_timing_id
      t.integer :holding_time
      t.float :velocity_x
      t.float :velocity_y

      t.timestamps
    end
  end
end
