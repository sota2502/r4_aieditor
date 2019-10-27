class ActionRuleCancel < ApplicationRecord
  belongs_to :action_chain
  belongs_to :action_rule
end
