class HpCondition < ApplicationRecord
  belongs_to :exaction
  has_many :action_routines, dependent: :destroy

  # items in exaction.action
  def for_lua
    action_routines.map(&:for_lua)
  end
end
