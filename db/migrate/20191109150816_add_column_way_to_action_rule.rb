class AddColumnWayToActionRule < ActiveRecord::Migration[6.0]
  def change
    add_column :action_rules, :way_id, :integer, after: :hold
  end
end
