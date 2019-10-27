class ActionRule < ApplicationRecord
  belongs_to :action_chain
  belongs_to :search
end
