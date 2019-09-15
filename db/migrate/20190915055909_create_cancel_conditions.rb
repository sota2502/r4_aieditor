class CreateCancelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :cancel_conditions do |t|
      t.references :action_rule, null: false, foreign_key: true
      t.integer :cancel_type_id
      t.references :probability, null: false, foreign_key: true
      t.float :probability_coefficient
      t.float :parameter1
      t.float :parameter2

      t.timestamps
    end
  end
end
