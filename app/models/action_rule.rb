class ActionRule < ApplicationRecord
  include Motionable
  include NextActTimingable
  belongs_to :action_chain
  belongs_to :search

  def target_type
    TargetType.new(target_value)
  end
end
