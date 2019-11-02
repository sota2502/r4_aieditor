class ActionRuleCancel < ApplicationRecord
  belongs_to :action_rule
  belongs_to :cancel_condition
end
