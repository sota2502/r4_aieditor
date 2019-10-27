class CreateActionChainCancels < ActiveRecord::Migration[6.0]
  def change
    create_table :action_chain_cancels do |t|
      t.references :action_chain, null: false, foreign_key: true
      t.references :cancel_condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
