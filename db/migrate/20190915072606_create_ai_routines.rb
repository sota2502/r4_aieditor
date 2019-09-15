class CreateAiRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :ai_routines do |t|
      t.string :name

      t.timestamps
    end
  end
end
