class TargetActionCondition < ApplicationRecord
  belongs_to :search_range
  belongs_to :probability
  belongs_to :action_group

  def hp_condition
    @hp_condition ||= begin
      HpCondition.new(self.hp_condition_id)
    end
  end

  def target_type
    @target_type ||= begin
      TargetType.new(self.target_type_id)
    end
  end

  def target_motion
    @target_motion ||= begin
      TargetMotion.new(self.target_motion_id)
    end
  end
end
