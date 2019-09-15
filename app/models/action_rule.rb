class ActionRule < ApplicationRecord
  belongs_to :action_group
  has_many :cancel_condition

  def action_type
    @action_type ||= begin
      ActionType.new(self.action_type_id)
    end
  end

  def next_act_timing 
    @next_act_timing ||= begin
      NextActTiming.new(self.next_act_timing_id)
    end
  end

  def caption
    "ID:#{self.id},Type:#{action_type.caption}"
  end
end
