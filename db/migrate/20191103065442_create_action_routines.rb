class CreateActionRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :action_routines do |t|
      t.references :hp_condition, null: false, foreign_key: true
      t.references :search, null: true, foreign_key: true
      t.integer :target_value
      t.integer :motion_id
      t.references :rate, null: true, foreign_key: true
      t.unsigned_float :rate_coefficient
      t.integer :cancel_type_id
      t.references :action_chain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
