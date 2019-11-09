module Motionable
  extend ActiveSupport::Concern

  def motion
    Motion.new(motion_id)
  end

  def motion=(object)
    self.motion_id = object.id
  end
end
