class CreateCancelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :cancel_conditions do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :cancel_type, null: false
      t.references :rate, null: false, foreign_key: true
      t.unsigned_integer :rate_coefficient
      t.integer :parameter1
      t.integer :parameter2

      t.timestamps
    end
  end
end
