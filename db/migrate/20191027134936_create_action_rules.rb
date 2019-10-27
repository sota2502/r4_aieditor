class CreateActionRules < ActiveRecord::Migration[6.0]
  def change
    create_table :action_rules do |t|
      t.references :action_chain, null: false, foreign_key: true
      t.integer :motion_id
      t.integer :move_x
      t.integer :move_y
      t.integer :next, null: false
      t.references :search, null: false, foreign_key: true
      t.integer :target_value
      t.unsigned_integer :hold

      t.timestamps
    end
  end
end
