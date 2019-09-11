class CreateSearchRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :search_ranges do |t|
      t.string :name, null: false
      t.float :left
      t.float :top
      t.float :right
      t.float :bottom 
      t.timestamps
    end
  end
end
