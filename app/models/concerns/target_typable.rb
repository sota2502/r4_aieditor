module TargetTypable
  extend ActiveSupport::Concern

  def target_type
    TargetType.new(value)
  end

  def target_type=(target_type)
    self.value = target_type.id
  end
end
