class Search < ApplicationRecord
  belongs_to :action_state

  validates :name, presence: true
  validates :x1, presence: true, numericality: { only_integer: true }
  validates :y1, presence: true, numericality: { only_integer: true }
  validates :x2, presence: true, numericality: { only_integer: true }
  validates :y2, presence: true, numericality: { only_integer: true }

  def for_lua
    [ name, attributes.values_at(*%w(x1 y1 x2 y2))]
  end
end
