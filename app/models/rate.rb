class Rate < ApplicationRecord
  belongs_to :action_state

  validates :name, presence: true
  validates :value, presence: true, numericality: { only_integer: true }

  def for_lua
    [ name, value ]
  end
end
