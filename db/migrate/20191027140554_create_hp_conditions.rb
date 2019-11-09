class CreateHpConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :hp_conditions do |t|
      t.references :exaction, null: false, foreign_key: true
      t.unsigned_integer :value, null: false

      t.timestamps
    end
  end
end
