class ActionRule < ApplicationRecord
  include Motionable
  include NextActTimingable
  belongs_to :action_chain
  belongs_to :search
  has_many :action_rule_cancels
  has_many :cancel_conditions, through: :action_rule_cancels

  def target_type
    TargetType.new(target_value)
  end
end
