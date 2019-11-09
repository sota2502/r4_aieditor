class CreateExactions < ActiveRecord::Migration[6.0]
  def change
    create_table :exactions do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
