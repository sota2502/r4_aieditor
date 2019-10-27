class CreateActionStates < ActiveRecord::Migration[6.0]
  def change
    create_table :action_states do |t|
      t.references :project, null: false, foreign_key: true
      t.string :chara
      t.string :field
      t.unsigned_integer :freq
      t.unsigned_integer :precis

      t.timestamps
    end
  end
end
