class ActionRoutine < ApplicationRecord
  include Motionable
  include CancelTypable
  belongs_to :hp_condition
  belongs_to :search
  belongs_to :rate
  belongs_to :action_chain

  def target_type
    TargetType.new(target_value)
  end
end
