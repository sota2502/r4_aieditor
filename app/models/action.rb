class Action < ApplicationRecord
  include Motionable
  belongs_to :hp_conditon
  belongs_to :search
  belongs_to :rate
  belongs_to :action_chain

  def target_type
    TargetType.new(target_value)
  end
end
