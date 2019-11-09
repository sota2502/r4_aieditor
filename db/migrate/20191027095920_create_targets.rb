class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.references :action_state, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
