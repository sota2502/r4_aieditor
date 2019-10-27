class CancelCondition < ApplicationRecord
  belongs_to :project
  belongs_to :rate
end
