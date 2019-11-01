class Project < ApplicationRecord
  has_one :action_state
  has_many :action_chains
  has_one :exaction
end
