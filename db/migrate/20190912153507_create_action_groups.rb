class CreateActionGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :action_groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
