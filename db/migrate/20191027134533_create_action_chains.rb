class CreateActionChains < ActiveRecord::Migration[6.0]
  def change
    create_table :action_chains do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
