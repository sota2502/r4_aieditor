class ActionState < ApplicationRecord
  belongs_to :project
  has_many :searches
  has_many :rates
  has_many :targets
end
