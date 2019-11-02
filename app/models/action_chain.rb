class ActionChain < ApplicationRecord
  belongs_to :project
  has_many :action_rules
  has_many :action_chain_cancels
  has_many :cancel_conditions, through: :action_chain_cancels
end
