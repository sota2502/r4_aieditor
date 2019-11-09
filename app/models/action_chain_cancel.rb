class ActionChainCancel < ApplicationRecord
  belongs_to :action_chain
  belongs_to :cancel_condition
end
