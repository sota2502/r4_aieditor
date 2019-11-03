class ActionChain < ApplicationRecord
  belongs_to :project
  has_many :action_rules
  has_many :action_chain_cancels
  has_many :cancel_conditions, through: :action_chain_cancels

  def for_lua
    obj = {
      name: name,
    }
    rules = action_rules.map.with_index(1) { |r, i| [i, r.for_lua] }.to_h
    cancels = cancel_conditions.map(&:for_lua)

    obj.merge(rules).merge(cancel: cancels)
  end
end
