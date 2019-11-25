module Motionable
  extend ActiveSupport::Concern

  def motion
    motion_id.present? ? Motion.new(motion_id) : nil
  end

  def motion=(object)
    self.motion_id = object.id
  end
end
