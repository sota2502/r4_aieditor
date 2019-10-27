class Action < ApplicationRecord
  belongs_to :hp_conditon
  belongs_to :search
  belongs_to :rate
  belongs_to :action_chain
end
