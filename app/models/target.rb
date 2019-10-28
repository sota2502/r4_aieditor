class Target < ApplicationRecord
  include TargetTypable
  belongs_to :action_state
end
