class CreateActionRules < ActiveRecord::Migration[6.0]
  def change
    create_table :action_rules do |t|
      t.references :action_chain, null: false, foreign_key: true
      t.integer :motion_id
      t.float :move_x
      t.float :move_y
      t.integer :next, null: true
      t.references :search, null: true, foreign_key: true
      t.integer :target_value, null: true
      t.unsigned_integer :hold

      t.timestamps
    end
  end
end
