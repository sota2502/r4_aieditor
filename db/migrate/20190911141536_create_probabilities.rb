class CreateProbabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :probabilities do |t|
      t.string :name, null: false
      t.float :default_value
      t.float :correction_value

      t.timestamps
    end
  end
end
