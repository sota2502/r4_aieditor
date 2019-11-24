class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.references :action_state, null: false, foreign_key: true
      t.string :name
      t.unsigned_float :value

      t.timestamps
    end
  end
end
