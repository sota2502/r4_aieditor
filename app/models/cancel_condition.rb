class CancelCondition < ApplicationRecord
  include CancelTypable
  belongs_to :project
  belongs_to :rate
end
