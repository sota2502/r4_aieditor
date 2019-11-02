class CreateCancelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :cancel_conditions do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :cancel_type_id, null: false
      t.references :rate, null: true, foreign_key: true
      t.unsigned_integer :rate_coefficient
      t.integer :parameter1, null: true
      t.integer :parameter2, null: true

      t.timestamps
    end
  end
end
