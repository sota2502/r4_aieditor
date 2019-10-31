class ActionChain < ApplicationRecord
  belongs_to :project
  has_many :action_rules
end
