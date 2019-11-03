class HpCondition < ApplicationRecord
  belongs_to :exaction
  has_many :action_routines
end
