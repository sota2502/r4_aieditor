class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.references :action_state, null: false, foreign_key: true
      t.string :name
      t.integer :x1
      t.integer :y1
      t.integer :x2
      t.integer :y2

      t.timestamps
    end
  end
end
