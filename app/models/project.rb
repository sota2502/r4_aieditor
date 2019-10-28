class Project < ApplicationRecord
  has_one :action_state
  has_one :action_chain
  has_one :exaction
end
