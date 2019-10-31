module Motionable
  extend ActiveSupport::Concern

  def motion
    TargetType.new(motion_id)
  end

  def target_type=(motion)
    self.motion_id = motion.id
  end
end
