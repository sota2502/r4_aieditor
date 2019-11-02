class CreateActionRuleCancels < ActiveRecord::Migration[6.0]
  def change
    create_table :action_rule_cancels do |t|
      t.references :action_rule, null: false, foreign_key: true
      t.references :cancel_condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
