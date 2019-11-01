class HpCondition < ApplicationRecord
  belongs_to :exaction
  has_many :actions
end
