class Target < ApplicationRecord
  include TargetTypable
  belongs_to :action_state

  validates :value, presence: true,
                    inclusion: { in: TargetType::DEFINITION.keys }
end
