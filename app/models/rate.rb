class Rate < ApplicationRecord
  belongs_to :action_state

  validates :name, presence: true
  validates :value, presence: true, numericality: true

  def name_with_value
    "#{name}(#{value}%)"
  end

  def for_lua
    [ name, value ]
  end
end
